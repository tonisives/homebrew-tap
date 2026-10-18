# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "c5e0b5396048e7bd1716e9d740a7e1e9aa2b800048f6b8c5a1daab2717e63f9c",
         intel: "956d47fa7e275bc1d5a518e692b9cb9b33df5cf602f3d77cb2b939fdc6fe0721"

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
