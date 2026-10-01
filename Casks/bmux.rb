# typed: false
# frozen_string_literal: true

cask "bmux" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "9ac0b436121034107259a961944d317464c7ff0dc58ee18580a33a9ce9020ce2",
         intel: "989dc14a93af049890251f0dfdb8fe1c1aae926560ae08bf07cba1cbb4e993b4"

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
