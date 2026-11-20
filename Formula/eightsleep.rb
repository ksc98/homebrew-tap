class Eightsleep < Formula
  desc "Command-line control for the Eight Sleep Pod"
  homepage "https://github.com/ksc98/8sleep-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.2/8sleep-aarch64-apple-darwin.tar.gz"
      sha256 "547ad170e9b0e4a7af7ef31cbe2dd6f09d7a7bf4d20fd010c71d2c70fef19bfd"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.2/8sleep-x86_64-apple-darwin.tar.gz"
      sha256 "978eae0c55ceb0e926456076c3b4519f8f34329df544156910a1791368ada299"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.2/8sleep-aarch64-unknown-linux-musl.tar.gz"
      sha256 "876e729ceb5f9072b3624863e4d113ce6e10c3a70fd4e7ab8ec3b8022a646e33"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.2/8sleep-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cadf57fe8b387a842b5c5efed05c04c6746018e42bf226355d62a65b2bc1d85e"
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
