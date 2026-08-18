# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "08649cd5ab0c862ca9474da15d320974f75eaf846f14313d90fd5400124c2227", intel: "70f2782fff920394e22867fd4d1defee546d2a2d81c524f11a0f6d58155cb0b7"

  url "https://github.com/tonisives/clawtab/releases/latest/download/clawtab_#{arch}.dmg"
  name "ClawTab"
  desc "Automated Claude Code job scheduler for macOS"
  homepage "https://clawtab.cc"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "ClawTab.app"
  binary "#{appdir}/ClawTab.app/Contents/Resources/cwtctl"
  zsh_completion "#{appdir}/ClawTab.app/Contents/Resources/_cwtctl"

  zap trash: [
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
    "~/.config/clawtab",
  ]
end
