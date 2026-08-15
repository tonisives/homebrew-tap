# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "b58dba4ab71af8e097b41f984064669c0939b31d33bbbf3d176df62493eea390", intel: "7a3c85a221d21464498d4cd62e6d82e5dd7446e96db1b8ac507dde4834c40300"

  url "https://github.com/tonisives/clawtab/releases/latest/download/clawtab_#{arch}.dmg"
  name "ClawTab"
  desc "Automated Claude Code job scheduler for macOS"
  homepage "https://clawtab.cc"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "ClawTab.app"
  binary "#{appdir}/ClawTab.app/Contents/Resources/cwtctl"
  zsh_completion "#{appdir}/ClawTab.app/Contents/Resources/_cwtctl"

  zap trash: [
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
    "~/.config/clawtab",
  ]
end
