# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "4df5adb63c5df6c59ef9cb6dbc8241d040bec0f6a36b06073f92ea71a190818f", intel: "674a8f86eb835719fc850e56a2ac402fa478813fab68f3f9f6162c7d8c3bf62c"

  url "https://github.com/tonisives/ovim/releases/latest/download/ovim_#{arch}.dmg"
  name "ovim"
  desc "System-wide Vim mode for macOS"
  homepage "https://github.com/tonisives/ovim"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "ovim.app"

  zap trash: [
    "~/Library/Application Support/com.tonis.ovim",
    "~/Library/Preferences/com.tonis.ovim.plist",
  ]
end
