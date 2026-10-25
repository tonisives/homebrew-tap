import hashlib
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

from scripts.update_release import ASSETS, update_cask, update_formula


TAP = Path(__file__).resolve().parents[1]


class UpdateReleaseTests(unittest.TestCase):
    def test_command_rejects_missing_asset_without_editing_tap(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "Casks").mkdir()
            target = root / "Casks" / "ovim.rb"
            original = (TAP / "Casks" / "ovim.rb").read_text()
            target.write_text(original)
            assets = root / "assets"
            assets.mkdir()
            (assets / "ovim_aarch64.dmg").write_bytes(b"example")
            result = subprocess.run(
                [sys.executable, str(TAP / "scripts" / "update_release.py"),
                 "--product", "ovim", "--tag", "v99.0.0",
                 "--assets", str(assets), "--tap", str(root)],
                capture_output=True, text=True, check=False,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("Missing or empty release asset", result.stderr)
            self.assertEqual(target.read_text(), original)

    def test_all_current_casks_accept_a_new_version(self):
        digest = hashlib.sha256(b"release asset").hexdigest()
        for product in ASSETS:
            with self.subTest(product=product):
                path = TAP / "Casks" / f"{product}.rb"
                result = update_cask(path, "99.0.0", digest, digest)
                self.assertIn('version "99.0.0"', result)
                self.assertEqual(result.count(digest), 2)

    def test_clawtab_host_and_desktop_are_separate_installs(self):
        host = update_cask(TAP / "Casks" / "clawtab.rb", "99.0.0", "a" * 64, "b" * 64)
        desktop = update_cask(TAP / "Casks" / "clawtab-desktop.rb", "99.0.0", "c" * 64, "d" * 64)
        self.assertIn('app "ClawTab Daemon.app"', host)
        self.assertIn('binary "cwtctl"', host)
        self.assertIn('target: "clawtab-daemon"', host)
        self.assertIn("clawtab-macos-#{arch}.tar.gz", host)
        self.assertNotIn('app "ClawTab.app"', host)
        self.assertNotIn("ClawTab.app/Contents/Resources", host)
        self.assertIn('app "ClawTab.app"', desktop)
        self.assertNotIn("  binary ", desktop)
        self.assertIn("clawtab_#{arch}.dmg", desktop)
        # Once migrated, later releases must keep the same host layout.
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "clawtab.rb"
            path.write_text(host)
            self.assertIn('version "99.0.1"', update_cask(path, "99.0.1", "e" * 64, "f" * 64))

    def test_clawtab_requires_both_host_and_desktop_assets_before_editing(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "Casks").mkdir()
            originals = {}
            for name in ("clawtab", "clawtab-desktop"):
                originals[name] = (TAP / "Casks" / f"{name}.rb").read_text()
                (root / "Casks" / f"{name}.rb").write_text(originals[name])
            assets = root / "assets"
            assets.mkdir()
            for name in ASSETS["clawtab"][1:-1]:
                (assets / name).write_bytes(name.encode())
            command = [
                sys.executable, str(TAP / "scripts" / "update_release.py"),
                "--product", "clawtab", "--tag", "v99.0.0",
                "--assets", str(assets), "--tap", str(root),
            ]
            result = subprocess.run(command, capture_output=True, text=True, check=False)
            self.assertNotEqual(result.returncode, 0)
            for name, original in originals.items():
                self.assertEqual((root / "Casks" / f"{name}.rb").read_text(), original)
            last_asset = ASSETS["clawtab"][-1]
            (assets / last_asset).write_bytes(last_asset.encode())
            subprocess.run(command, capture_output=True, text=True, check=True)
            for name in originals:
                contents = (root / "Casks" / f"{name}.rb").read_text()
                self.assertIn('version "99.0.0"', contents)

    def test_easy_kpf_formula_replaces_all_three_urls_and_hashes(self):
        assets = ASSETS["easy-kpf"][3:]
        hashes = {asset: hashlib.sha256(asset.encode()).hexdigest() for asset in assets}
        result = update_formula(TAP / "Formula" / "easykpf.rb", "99.0.0", hashes)
        for asset, digest in hashes.items():
            self.assertIn(f"/v99.0.0/{asset}", result)
            self.assertIn(digest, result)

    def test_rejects_downgrade_and_unexpected_structure(self):
        digest = "a" * 64
        path = TAP / "Casks" / "ovim.rb"
        with self.assertRaisesRegex(ValueError, "downgrade"):
            update_cask(path, "0.0.1", digest, digest)
        with tempfile.TemporaryDirectory() as directory:
            broken = Path(directory) / "ovim.rb"
            broken.write_text(path.read_text().replace("         intel:", "         wrong:"))
            with self.assertRaisesRegex(ValueError, "Expected one match"):
                update_cask(broken, "99.0.0", digest, digest)


if __name__ == "__main__":
    unittest.main()
