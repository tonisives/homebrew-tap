#!/usr/bin/env python3
"""Update tap entries only from a complete, versioned release asset set."""

import argparse
import hashlib
import re
from pathlib import Path


ASSETS = {
    "clawtab": ("clawtab", "clawtab_aarch64.dmg", "clawtab_x64.dmg"),
    "easy-kpf": (
        "easy-kpf",
        "EasyKpf_aarch64.dmg",
        "EasyKpf_x64.dmg",
        "easykpf-macos-aarch64.tar.gz",
        "easykpf-macos-x86_64.tar.gz",
        "easykpf-linux-x86_64.tar.gz",
    ),
    "ovim": ("ovim", "ovim_aarch64.dmg", "ovim_x64.dmg"),
    "bmux": ("bmux", "bmux-{version}-arm64.dmg", "bmux-{version}-x64.dmg"),
}


def replace_one(contents: str, pattern: str, replacement: str) -> str:
    updated, count = re.subn(pattern, lambda _: replacement, contents, flags=re.MULTILINE)
    if count != 1:
        raise ValueError(f"Expected one match for {pattern!r}, found {count}")
    return updated


def update_cask(path: Path, version: str, arm: str, intel: str) -> str:
    contents = path.read_text()
    current = re.search(r'^  version "([0-9]+\.[0-9]+\.[0-9]+)"$', contents, re.MULTILINE)
    if current and tuple(map(int, version.split("."))) < tuple(map(int, current.group(1).split("."))):
        raise ValueError(f"Refusing to downgrade {path} from {current.group(1)} to {version}")
    contents = replace_one(contents, r'^  version "[0-9]+\.[0-9]+\.[0-9]+"$', f'  version "{version}"')
    contents = replace_one(
        contents,
        r'^  sha256 arm:   "[0-9a-f]{64}",\n         intel: "[0-9a-f]{64}"$',
        f'  sha256 arm:   "{arm}",\n         intel: "{intel}"',
    )
    expected_url = {
        "clawtab": "clawtab_#{arch}.dmg",
        "easy-kpf": "EasyKpf_#{arch}.dmg",
        "ovim": "ovim_#{arch}.dmg",
        "bmux": "bmux-#{version}-#{arch}.dmg",
    }[path.stem]
    expected = f'https://github.com/tonisives/{path.stem}/releases/download/v#{{version}}/{expected_url}'
    if contents.count(f'  url "{expected}"') != 1:
        raise ValueError(f"Unexpected release URL in {path}")
    return contents


def update_formula(path: Path, version: str, hashes: dict[str, str]) -> str:
    contents = path.read_text()
    for asset, digest in hashes.items():
        escaped = re.escape(asset)
        pattern = (
            r'^      url "https://github\.com/tonisives/easy-kpf/releases/download/'
            rf'v[0-9]+\.[0-9]+\.[0-9]+/{escaped}"\n'
            r'      sha256 "[0-9a-f]{64}"$'
        )
        replacement = (
            f'      url "https://github.com/tonisives/easy-kpf/releases/download/v{version}/{asset}"\n'
            f'      sha256 "{digest}"'
        )
        contents = replace_one(contents, pattern, replacement)
    return contents


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--product", choices=ASSETS, required=True)
    parser.add_argument("--tag", required=True)
    parser.add_argument("--assets", type=Path, required=True)
    parser.add_argument("--tap", type=Path, required=True)
    args = parser.parse_args()

    if not re.fullmatch(r"v[0-9]+\.[0-9]+\.[0-9]+", args.tag):
        parser.error("Release tag must be vMAJOR.MINOR.PATCH")
    version = args.tag[1:]
    product, *patterns = ASSETS[args.product]
    assets = [pattern.format(version=version) for pattern in patterns]
    hashes = {}
    for name in assets:
        path = args.assets / name
        if not path.is_file() or path.stat().st_size == 0:
            parser.error(f"Missing or empty release asset: {name}")
        digest = hashlib.sha256()
        with path.open("rb") as asset:
            for chunk in iter(lambda: asset.read(1024 * 1024), b""):
                digest.update(chunk)
        hashes[name] = digest.hexdigest()

    cask = args.tap / "Casks" / f"{product}.rb"
    changes = {cask: update_cask(cask, version, hashes[assets[0]], hashes[assets[1]])}
    if product == "easy-kpf":
        formula = args.tap / "Formula" / "easykpf.rb"
        changes[formula] = update_formula(formula, version, {name: hashes[name] for name in assets[2:]})
    for path, contents in changes.items():
        path.write_text(contents)


if __name__ == "__main__":
    main()
