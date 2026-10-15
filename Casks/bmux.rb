# typed: false
# frozen_string_literal: true

cask "bmux" do
  arch arm: "arm64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "81a70b172508e61fd634190d5896f0eef4346e0954789cff7c14239559073705",
         intel: "22a2e108fd540264a983b857f442a2db88e749a232e7af8661714f38eadda574"

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
