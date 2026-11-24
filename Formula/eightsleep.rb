class Eightsleep < Formula
  desc "Command-line control for the Eight Sleep Pod"
  homepage "https://github.com/ksc98/8sleep-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.5/8sleep-aarch64-apple-darwin.tar.gz"
      sha256 "b2537ac74151ce6e8e424365f425f84d0a987a7ae01a57f7efcc9b39b9a11540"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.5/8sleep-x86_64-apple-darwin.tar.gz"
      sha256 "56645ec0e5876d04aa0ae688139f5a4eccc842672455836b29a7603f925ee992"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.5/8sleep-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0be95206020ae25240b38950081432377145913a2852bcc8ffb8a19830dad7ad"
    end
    on_intel do
      url "https://github.com/ksc98/8sleep-cli/releases/download/v0.1.5/8sleep-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f1e212ca8e7c269035a0e4e5f595d68f43fe754ad2a02301c227fc68c5ac2ef3"
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
