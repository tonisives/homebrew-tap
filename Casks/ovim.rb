# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "7142bafaefe147185b925e49403f007177f8e6b2573e4a949bd8a4445911ea2d",
         intel: "64ac405f07755002db96f538b4332c94fe66f9ce7dd3dffce93a17ca6e426daf"

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
