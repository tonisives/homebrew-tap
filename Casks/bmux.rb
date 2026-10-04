# typed: false
# frozen_string_literal: true

cask "bmux" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "07478193c14601b67daa6ae9ab89d8a80e020151cba6306f2801836d60073f72",
         intel: "ed6cfe66f216ae3518f82ceec3fe933529af370f73decbd33a6dbf78b1d898f9"

  url "https://github.com/tonisives/bmux/releases/download/v#{version}/bmux-#{version}-#{arch}.dmg"
  name "bmux"
  desc "Keyboard-driven Chromium browser with tmux-style sessions"
  homepage "https://bmux.tonis.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "node"
  depends_on macos: :monterey

  app "bmux.app"
  binary "#{appdir}/bmux.app/Contents/Resources/bin/bmux.mjs", target: "bmux"

  zap trash: [
    "~/Library/Application Support/bmux",
    "~/Library/Preferences/bmux.tonis.dev.plist",
    "~/Library/Saved Application State/bmux.tonis.dev.savedState",
  ]
end
