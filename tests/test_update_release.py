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
