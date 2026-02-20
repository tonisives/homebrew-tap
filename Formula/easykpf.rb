# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "e97d5f33fc6f4b8ed6ebe6f998972a9dbca9d887195fa38eddac2394b100e8bf"

      def install
        bin.install "easykpf-macos-aarch64" => "easykpf"
      end
    end

    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-x86_64.tar.gz"
      sha256 "6e9383fabc4d0a495d4b4b129811cf6eb9c4046b39798a721f99b357738ab50b"

      def install
        bin.install "easykpf-macos-x86_64" => "easykpf"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-linux-x86_64.tar.gz"
      sha256 "d330c2c90e65972bf386fb1b66335e45c1e54e7cf8ce2a8008a51fa49bfa556b"

      def install
        bin.install "easykpf-linux-x86_64" => "easykpf"
      end
    end
  end

  test do
    # The CLI is a TUI app that requires a terminal, so just verify the binary exists
    assert_predicate bin/"easykpf", :exist?
    assert_predicate bin/"easykpf", :executable?
  end
end
