class Eightsleep < Formula
  desc "Command-line control for the Eight Sleep Pod"
  homepage "https://github.com/ksc98/8sleep-cli"
  url "https://github.com/ksc98/8sleep-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "aed1767d6ded072fc39ee173323185a4cf7a3c0a9f8656e5fba2be982da53e61"
  license "MIT"
  head "https://github.com/ksc98/8sleep-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Put your Eight Sleep login in ~/.config/8sleep/config.toml:
        email = "you@example.com"
        password = "..."
      or name a 1Password item instead:
        onepassword = "op://Personal/EightSleep"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/8sleep --version")
    assert_match "no Eight Sleep credentials",
      shell_output("XDG_CONFIG_HOME=#{testpath} XDG_CACHE_HOME=#{testpath} #{bin}/8sleep status 2>&1", 1)
  end
end
