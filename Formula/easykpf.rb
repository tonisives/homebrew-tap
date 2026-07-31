# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "44acc4a387865c31be85511f4117a090473b3f976874b377e00e1bd8fc19e8ea"

      def install
        bin.install "easykpf"
        bin.install "ekpfctl"
        bash_completion.install "completions/ekpfctl.bash" => "ekpfctl"
        zsh_completion.install "completions/_ekpfctl"
        fish_completion.install "completions/ekpfctl.fish"
      end
    end

    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-x86_64.tar.gz"
      sha256 "d3615330f6b5a1df678eca047e2d74c6972b9e44d60b2dd13ca317deee71c188"

      def install
        bin.install "easykpf"
        bin.install "ekpfctl"
        bash_completion.install "completions/ekpfctl.bash" => "ekpfctl"
        zsh_completion.install "completions/_ekpfctl"
        fish_completion.install "completions/ekpfctl.fish"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-linux-x86_64.tar.gz"
      sha256 "ab9e5aa747580d8d27239b8047d136a45749bcb0d400f076467867740bdc55fa"

      def install
        bin.install "easykpf"
        bin.install "ekpfctl"
        bash_completion.install "completions/ekpfctl.bash" => "ekpfctl"
        zsh_completion.install "completions/_ekpfctl"
        fish_completion.install "completions/ekpfctl.fish"
      end
    end
  end

  test do
    assert_predicate bin/"easykpf", :exist?
    assert_predicate bin/"easykpf", :executable?
    assert_predicate bin/"ekpfctl", :exist?
    assert_predicate bin/"ekpfctl", :executable?
  end
end
