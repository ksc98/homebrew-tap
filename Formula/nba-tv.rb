class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/homebrew-tap"
  version "1.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.2/nba-tv-macos-arm64.tar.gz"
      sha256 "b72b6c8cf7421f4a99529f3825dbc79df6f02bb4ff1d40890964d171e9c016d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.2/nba-tv-linux-x86_64.tar.gz"
      sha256 "7b0c4131fed88d63f7728788f880a21c2dec5bdf77e16a47184f142bc727f4e6"
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
