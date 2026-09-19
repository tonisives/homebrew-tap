# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "95591951967026701896fb379f67856688f22af64e529bb46795772fee5ebf17", intel: "6bd305026b3db725fab8161e522858c3440991d85269bb61ae73db5fb9136e45"

  url "https://github.com/tonisives/clawtab/releases/latest/download/clawtab_#{arch}.dmg"
  name "ClawTab"
  desc "Automated Claude Code job scheduler for macOS"
  homepage "https://clawtab.cc"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ClawTab.app"
  binary "#{appdir}/ClawTab.app/Contents/Resources/cwtctl"
  zsh_completion "#{appdir}/ClawTab.app/Contents/Resources/_cwtctl"

  zap trash: [
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
    "~/.config/clawtab",
  ]
end
