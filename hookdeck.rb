# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Hookdeck < Formula
  desc "Hookdeck CLI utility"
  homepage "https://hookdeck.com"
  version "0.3.6"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.3.6/hookdeck_0.3.6_mac-os_x86_64.tar.gz"
    sha256 "59fd224ac9156da1da217cac7efe975f53aee6f1846968c5c109b6414e616148"
  end

  def install
    bin.install "hookdeck"
    rm Dir["#{bin}/{hookdeck-completion.bash,hookdeck-completion.zsh}"]
    system bin/"hookdeck", "completion", "--shell", "bash"
    system bin/"hookdeck", "completion", "--shell", "zsh"
    bash_completion.install "hookdeck-completion.bash"
    zsh_completion.install "hookdeck-completion.zsh"
    (zsh_completion/"_hookdeck").write <<~EOS
      #compdef hookdeck
      _hookdeck () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/hookdeck-completion.zsh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end

  def caveats; <<~EOS
    ❤ Thanks for installing the Hookdeck CLI! If this is your first time using the CLI, be sure to run `hookdeck login` first.
  EOS
  end
end
