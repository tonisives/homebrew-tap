# typed: false
# frozen_string_literal: true

cask "bmux" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "df55143df8b1acf8c386e7bf8a35ea2b3ed4067f554ffc94297362cc49a637b3",
         intel: "9887faabe99afbba32e5c00a3146302e8053c2acd3afe9e66cfcf806392963dc"

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
