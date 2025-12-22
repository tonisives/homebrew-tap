# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "fe600679811d42d9768fd15383ee3b705b2d651d252e5d60807d49118c20b0bc"

      def install
        bin.install "easykpf-macos-aarch64" => "easykpf"
      end
    end

    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-x86_64.tar.gz"
      sha256 "aa9d97ccef71d1454e519103ffe542f7258fbb5cc74f60335bfd9cef7298a3db"

      def install
        bin.install "easykpf-macos-x86_64" => "easykpf"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-linux-x86_64.tar.gz"
      sha256 "5beed93d12f880cf101136fac6b35a99b358c443c802972554e3f3f4fdec95d0"

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
