# typed: false
# frozen_string_literal: true

cask "easy-kpf" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "6608075ee19b4fed3cecee2c2526efc47daf63fd32f2e0d2a7ccdd41b3ee1452", intel: "dff6c92996a79ae7dfc465bdecffeaa88fc37ab13b4aba762b840388dff5cc24"

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
