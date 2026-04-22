class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/nba-tv"
  url "https://github.com/ksc98/nba-tv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "96eea66185741d58a55284b28ddcb2c828580092cbbf6802b08dec4f8a571d11"
  license "MIT"
  head "https://github.com/ksc98/nba-tv.git", branch: "main"

  depends_on "rust" => :build
  depends_on "mpv"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "nba-tv", shell_output("#{bin}/nba-tv --help")
  end
end
