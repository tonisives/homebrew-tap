# typed: false
# frozen_string_literal: true

cask "easy-kpf" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "685f613022c895f69a431666be6a9a52663af27a8aa5021d00a61c5eb975d6a0", intel: "29c04723b7b8e7a06c5e87c358c574712f76f7f64daea802e60180b214e976ee"

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
