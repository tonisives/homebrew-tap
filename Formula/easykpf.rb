# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "457732a4d7cd1e46fa89ffd0f3448de020bbdb8d18c55cf1f588bf9643c890a2"

      def install
        bin.install "easykpf-macos-aarch64" => "easykpf"
      end
    end

    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-x86_64.tar.gz"
      sha256 "8148866f7545a4870aad54be321997dc2841198310ae1903759e14cc2f6c701b"

      def install
        bin.install "easykpf-macos-x86_64" => "easykpf"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-linux-x86_64.tar.gz"
      sha256 "2d19dfb15c45efee32fb0032b167ccd85704fdf4a60b09e43582939017fef5f2"

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
