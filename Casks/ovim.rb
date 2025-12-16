# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 :no_check

  url "https://github.com/tonisives/ti-vim-rust/releases/latest/download/ovim_#{arch}.dmg"
  name "ovim"
  desc "System-wide Vim mode for macOS"
  homepage "https://github.com/tonisives/ti-vim-rust"

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
