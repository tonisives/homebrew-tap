# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "32aa6f42550688d28ef3a2279f15aeb7b479f875c485f11717e207b6a60d085c", intel: "823e29bde297607874c15b58844b40885b20e51cb77b2f2334f365b1a2de4b91"

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
