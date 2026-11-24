class Eightsleep < Formula
  desc "Command-line control for the Eight Sleep Pod"
  homepage "https://github.com/ksc98/8sleep-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.4/8sleep-aarch64-apple-darwin.tar.gz"
      sha256 "6edb52cec34c6c9512f8b072291b0c22967683e6af0cebffba8bfddfd3e04554"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.4/8sleep-x86_64-apple-darwin.tar.gz"
      sha256 "8a29de1d7dcdf1aa16fad441e91599e0771f9b0c6ac964aa70b1ca5e1966bcd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.4/8sleep-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f9d7aaa1125c9a432e2a1f74559b2a98c6065ca22b7db6723fdd4b872f536c95"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.4/8sleep-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d97d8ec63bdbc4ffe7cafaaa84cd0722a56d5a220ab3a9caa3f9c8df36c532af"
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
