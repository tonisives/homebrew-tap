# typed: false
# frozen_string_literal: true

cask "easy-kpf" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "f7b5758b43f82b22be161f7a455d15a07be06975b0839655e42c5738f79c7965", intel: "40eb39baf58b7fddc3a189843ae82cb00ea07a019f4b17a5c8530277b787e110"

  url "https://github.com/tonisives/easy-kpf/releases/latest/download/EasyKpf_#{arch}.dmg"
  name "Easy KPF"
  desc "Kubernetes port forward manager with visual interface"
  homepage "https://github.com/tonisives/easy-kpf"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :high_sierra"

  app "EasyKpf.app"

  zap trash: [
    "~/Library/Application Support/EasyKpf",
    "~/Library/Preferences/com.tonisives.easy-kpf.plist",
  ]
end
