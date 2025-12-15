# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 :no_check

      def install
        bin.install "easykpf-macos-aarch64" => "easykpf"
      end
    end

    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-x86_64.tar.gz"
      sha256 :no_check

      def install
        bin.install "easykpf-macos-x86_64" => "easykpf"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-linux-x86_64.tar.gz"
      sha256 :no_check

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
