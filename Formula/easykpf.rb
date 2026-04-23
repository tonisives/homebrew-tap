# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "f4deef5f0bdac2df1f72841004f2bcf573f00219593ae81d87036ac3d21423ef"

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
      sha256 "2b121e1fe38a6ba504aba7ba114057923444e9f2d0475bfa2af8529f1ae204e5"

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
      sha256 "85cf2f87a0d741d3bfb1e37657b68fc8792db6773da51937eb02cd9b07b82e63"

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
