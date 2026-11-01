# typed: false
# frozen_string_literal: true

cask "clawtab-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "915b66ddbe7eec687cfbf0aac3bf7d591ad8efda6202ecf7d38bf07cb2e7341e",
         intel: "fec45ba7c1f245bad4e933e4a4967bb3e8f58a0af85964272eef0f8530de467d"

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
