class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/homebrew-tap"
  version "1.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.4/nba-tv-macos-arm64.tar.gz"
      sha256 "2492c97a44a8009fef11159289ef8ca536d073ebcc5d70fa61dda863fafbcf01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.4/nba-tv-linux-x86_64.tar.gz"
      sha256 "84ea096eb197d37884b046c285468478efdeeb0a09dabf1524bb44eec897d0c7"
    end
  end

  depends_on "mpv"
  depends_on "whisper-cpp" => :recommended

  def install
    bin.install "nba-tv"
  end

  test do
    assert_match "nba-tv", shell_output("#{bin}/nba-tv --help")
  end
end
