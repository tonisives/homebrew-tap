# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "478e5071827e6fe8bbf505465aa96a0c4c654091c9c809a45a9e313b04ee3eb6",
         intel: "db6361585c43c0dd623326afa4b892737cadfbbc068a671051d1c4efc1f4f399"

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
