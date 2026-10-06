# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.19"
  sha256 arm:   "a3afe78fa555a8a9df3b61c9ac1a17bbe711a32b25b72d3018e779cefaff384c",
         intel: "3d6c9892502fa143a54fad2671726f9e69817dec91dd393b3d3f53c949d87ab5"

  url "https://github.com/tonisives/clawtab/releases/download/v#{version}/clawtab_#{arch}.dmg"
  name "ClawTab"
  desc "Automated Claude Code job scheduler"
  homepage "https://clawtab.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ClawTab.app"
  binary "#{appdir}/ClawTab.app/Contents/Resources/cwtctl"
  zsh_completion "#{appdir}/ClawTab.app/Contents/Resources/_cwtctl"

  zap trash: [
    "~/.config/clawtab",
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
  ]
end
