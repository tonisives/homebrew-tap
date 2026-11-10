# typed: false
# frozen_string_literal: true

cask "clawtab-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "c01f18a779a91487dba29d04335d077bd0a8ea352a39f2aa2776c9cba7e726c7",
         intel: "89cdcf5557abf843659e213bb8c9adc390402fcac4280c192f35b164420fe0e8"

  url "https://github.com/tonisives/clawtab/releases/download/v#{version}/clawtab_#{arch}.dmg"
  name "ClawTab Desktop"
  desc "Desktop workspace for coding agents"
  homepage "https://clawtab.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ClawTab.app"

  zap trash: [
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
  ]
end
