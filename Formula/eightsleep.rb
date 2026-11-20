class Eightsleep < Formula
  desc "Command-line control for the Eight Sleep Pod"
  homepage "https://github.com/ksc98/8sleep-cli"
  url "https://github.com/ksc98/8sleep-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "53d2310eabf8ef377afa7e7cee548514cdf914a27d1619abe673eeaa8ff2fac1"
  license "MIT"
  head "https://github.com/ksc98/8sleep-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
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
