# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "9b73c98e17fbf74cea88e57e840b1731efca2e813942d4c8a16cc767d0aee9cc", intel: "76631b835f58fb5ceee749dc2fe10fbe9bd98a5e9bba34fc2eb2907a63b725f3"

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
