# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "e52dce3d5dac53b25b223aa4b6c2492161a41acba032456918a43d4452086e0c",
         intel: "d29439f20b02986818c78c92380b316b5210e7774591929c9624989d63b0c245"

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
  binary "cwtctl"
  zsh_completion "_cwtctl"

  zap trash: [
    "~/.config/clawtab",
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
  ]
end
