# typed: false
# frozen_string_literal: true

cask "clawtab" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "ca192a243194f7997946e11142b728529710480bd48f7a98419e98bf26848879", intel: "04d513fe0db0873772905b319368274de01fa2eb9b49471a65435d12550b0a04"

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

  zap trash: [
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
    "~/.config/clawtab",
  ]
end
