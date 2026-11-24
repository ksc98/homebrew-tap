class Eightsleep < Formula
  desc "Command-line control for the Eight Sleep Pod"
  homepage "https://github.com/ksc98/8sleep-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.6/8sleep-aarch64-apple-darwin.tar.gz"
      sha256 "926f73fbf7d0b2dd051d5bbcc38528c18bbaa7d9c669dab57f85146cb7ec7961"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.6/8sleep-x86_64-apple-darwin.tar.gz"
      sha256 "298783632b81e0045bb7e0cebd430dd20f08911e8a837bc181e3380989722f11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.6/8sleep-aarch64-unknown-linux-musl.tar.gz"
      sha256 "180fdfbc9e14b6e262ef8de7cb644a12f1ebf554b095247c95ffc916acb505d0"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.6/8sleep-x86_64-unknown-linux-musl.tar.gz"
      sha256 "42b46dcc5fc0023a46d14021134d6609cff8e95345c9f5fc6c4cb10a4dd3e685"
    end
  end

  def install
    bin.install "8sleep"
  end

  def caveats
    <<~EOS
      Sign in with your Eight Sleep email and password:
        8sleep setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/8sleep --version")
    assert_match "no Eight Sleep credentials",
      shell_output("XDG_CONFIG_HOME=#{testpath} XDG_CACHE_HOME=#{testpath} #{bin}/8sleep status 2>&1", 1)
  end
end
