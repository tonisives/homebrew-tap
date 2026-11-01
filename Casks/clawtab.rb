# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "5bd074dcd2afca00fda5ac7c3f4a62940065df9d0ec1ed65a8fcdc0e00512bf5",
         intel: "508c4cce45b0734e40f14db94126895b248df3d5f2f06d035109dfada1d56275"

  url "https://github.com/tonisives/clawtab/releases/download/v#{version}/clawtab-macos-#{arch}.tar.gz"
  name "ClawTab"
  desc "Headless agent daemon and terminal tools"
  homepage "https://clawtab.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ClawTab Daemon.app"
  binary "#{appdir}/ClawTab Daemon.app/Contents/MacOS/ClawTab Daemon", target: "clawtab-daemon"
  binary "#{appdir}/ClawTab Daemon.app/Contents/MacOS/clawtab-hook"
  binary "cwt"
  zsh_completion "_cwt"

  zap trash: [
    "~/.config/clawtab",
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
  ]
end
