class Eightsleep < Formula
  desc "Command-line control for the Eight Sleep Pod"
  homepage "https://github.com/ksc98/8sleep-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.3/8sleep-aarch64-apple-darwin.tar.gz"
      sha256 "86b4b4c13ac2d6bd1449806d189514a943ef45f55037dcc9ea828249cd95d7c1"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.3/8sleep-x86_64-apple-darwin.tar.gz"
      sha256 "b10e636a21a25d3152dfbf30f40efdb0c107ccbee8560e28f2a6cdbeaa1b1722"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.3/8sleep-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5d581e74bd4481a9f61b5d41ba10e1d44468cd4b94e557c39dacaf936f5a79ed"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.3/8sleep-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e3a97a28daf0e7dfe1106b18f2a83f7132e224be51178681b5bf9cbeb0739031"
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
