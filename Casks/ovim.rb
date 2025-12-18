# typed: false
# frozen_string_literal: true

cask "ovim" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "02574cdb03913c54dae5db884fc167e8533cc774e5a2a203cdb7f4ede54fdf18", intel: "d07ea6b018b16e982a4e612da075446afae697b442856a21c0bfc76c8a9ab7bb"

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
