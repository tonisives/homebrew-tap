# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "75b16446aa991339166544d843f4c3780b4ce3be18821c21faf0f2c332ed2823"

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
      sha256 "3ca57114f17ee317996dc42cc8f0c29ea892b9b43326f0e31e16ea4aeab172ae"

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
      sha256 "98929ce56e3ad024ff7cb83f61df0e017cfc8a806b7ed3ebb5434885a8de1f10"

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
