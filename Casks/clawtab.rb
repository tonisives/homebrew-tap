# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "f6f4736d73d074138b866a7acd2d2a0289105812f1594d889c9d753063fffca5", intel: "0333c116145c28770c7a013146d2c3c27cf3f1b02d27c110e646f6f5629add4e"

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

  zap trash: [
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
    "~/.config/clawtab",
  ]
end
