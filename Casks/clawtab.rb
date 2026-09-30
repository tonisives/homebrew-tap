# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.17"
  sha256 arm:   "52ec0401c2e500b466d8b7c946059075f891c0e26beff2f8c76b235f5edf8448",
         intel: "77eb9e23d2cdd6d5dc1e0696a6115c24edd17b4a6587e89da922504fe2d8c232"

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
