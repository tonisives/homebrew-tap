# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "d0920aa2501739565d04795946e90d72ddbb1bc5f66602b73ffbec92e590913a", intel: "9a0e4572371d0858acd67bcf7f2fc0343240bff6f7c2d7ff2c76b04aa1095a15"

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
