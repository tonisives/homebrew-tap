# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "54fa25f02b3fc6193a0c689ad5e30221fbccac6aab5c4ca1eddab150264e18a1", intel: "ce1bf5af6ad8937fff42a90dc47bd90bda9a6be0d6fa4bf338d3474c8341b336"

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
