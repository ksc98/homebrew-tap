class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/nba-tv"
  version "0.1.1"
  license "MIT"

  url "https://github.com/ksc98/nba-tv/releases/download/v0.1.1/nba-tv-macos-arm64.tar.gz"
  sha256 "3e1d5f5ea1796841270c5580d8c791d205f3453ee272d9b45017b581e5f07215"

  depends_on "mpv"
  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "nba-tv"
  end

  test do
    assert_match "nba-tv", shell_output("#{bin}/nba-tv --help")
  end
end
