# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.33"
  sha256 arm:   "fbc822ce2c66d6d50245569d3175b56b2be0756b4fe1be1c4fcc508d91acbbc4",
         intel: "74b3176c3bc9a09f30b97bd12fb7c5c4807a11f0999875f7ce86038b37b886eb"

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
