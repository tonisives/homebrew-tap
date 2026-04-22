# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "ed51fce4935d669e529ff6a23b47a42bb0523cfd01b97088f93fe67eb487f28b"

      def install
        bin.install "easykpf-macos-aarch64" => "easykpf"
      end
    end

    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-x86_64.tar.gz"
      sha256 "4e12bc62a06e17e4e631c0f377799a36fdcf41c7a3abb33fdf267bb0cc0108c1"

      def install
        bin.install "easykpf-macos-x86_64" => "easykpf"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-linux-x86_64.tar.gz"
      sha256 "93ad48a53a07ee53a84c3fffe678a22c84fd9201c8fdd7242e98aca944267603"

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
