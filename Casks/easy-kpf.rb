# typed: false
# frozen_string_literal: true

cask "easy-kpf" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "0f98a06eddfd2117aaa5b0f3a5480eb68c3bff1fecd530650cc9964f8a1bd554", intel: "bdc35ff2f58002639da3bad038e5b5316830ab87b2c78c3dfb78d5dca587488c"

  url "https://github.com/tonisives/easy-kpf/releases/latest/download/EasyKpf_#{arch}.dmg"
  name "Easy KPF"
  desc "Kubernetes port forward manager with visual interface"
  homepage "https://github.com/tonisives/easy-kpf"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "EasyKpf.app"

  zap trash: [
    "~/Library/Application Support/EasyKpf",
    "~/Library/Preferences/com.tonisives.easy-kpf.plist",
  ]
end
