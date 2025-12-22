# typed: false
# frozen_string_literal: true

cask "easy-kpf" do
  arch arm: "aarch64", intel: "x64"

  version :latest
  sha256 arm: "867976357ed3041029308bf4ea711b148a8bdd09a7b52e9497b5e1f05940ba1e", intel: "8e5e21afe25c676e51fdc18dbec6fb4aa0312301ae0b7d39e6f9aef56de09273"

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
