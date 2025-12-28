# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "6cd0564e641e0d6e6083add1181fd5956367e914f7089595b4cfcc1ab6f2b8f6", intel: "3555e83c5f63d54f08da993a6b9fb936ec43fc296d76e4b6cc407a3fe76849b6"

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
