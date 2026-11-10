# typed: false
# frozen_string_literal: true

cask "bmux" do
  arch arm: "arm64", intel: "x64"

  version "0.1.14"
  sha256 arm:   "7035eee7c79eb27e0c573e9bb51e23445e22a16826961ca8407661a9e8a12d25",
         intel: "f3f6f7a512d0284e768391f1190ef6aea6f45c05b3361146e06dbc7dfee945a6"

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
