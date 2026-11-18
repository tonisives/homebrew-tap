# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "5aa0a9d1a2c2c5d5ead89d5179480b3ce5023843eed4e71ccf508d2a7036272d",
         intel: "bac1f3e8b666e4de1b114ddf2899f6177fdc6a827db3f18b6c07ae2dc5c4792d"

  url "https://github.com/tonisives/ovim/releases/download/v#{version}/ovim_#{arch}.dmg"
  name "ovim"
  desc "System-wide Vim mode"
  homepage "https://github.com/tonisives/ovim"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ovim.app"

  zap trash: [
    "~/Library/Application Support/com.tonis.ovim",
    "~/Library/Preferences/com.tonis.ovim.plist",
  ]
end
