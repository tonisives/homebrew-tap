# typed: false
# frozen_string_literal: true

class Easykpf < Formula
  desc "CLI/TUI for kubectl port forward management"
  homepage "https://github.com/tonisives/easy-kpf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tonisives/easy-kpf/releases/latest/download/easykpf-macos-aarch64.tar.gz"
      sha256 "61f700091de692bd7b283d937ec81e63bb4946344e8ca1d1c060aa89434d5a1c"

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
      sha256 "3990f5dc81ee6f126c6a07d2b94a4a9f88a499bc3cd12ed3abe561a3b3865cf9"

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
      sha256 "2ec33da1b953fa7b9367af07d98f3e7cf82e40074eafdca566e16f691cd102d9"

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
