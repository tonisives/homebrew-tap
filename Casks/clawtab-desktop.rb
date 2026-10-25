# typed: false
# frozen_string_literal: true

cask "clawtab-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "447b1fe42e177aacaa1f25918756e1132f9cdf3db2bec5a5c190964435afeeaf",
         intel: "3dd9f514710f8d372b6fe31b5b834ee942ad417cbca040e434bf683ef255e6d8"

  url "https://github.com/tonisives/clawtab/releases/download/v#{version}/clawtab_#{arch}.dmg"
  name "ClawTab Desktop"
  desc "Desktop workspace for coding agents"
  homepage "https://clawtab.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ClawTab.app"

  zap trash: [
    "~/Library/Application Support/com.tgs.clawtab",
    "~/Library/Preferences/com.tgs.clawtab.plist",
  ]
end
