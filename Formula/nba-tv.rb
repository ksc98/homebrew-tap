class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/homebrew-tap"
  version "1.5.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.6/nba-tv-macos-arm64.tar.gz"
      sha256 "a3939b1343cffbd81e143484f4bbc57c39a599e001010481f16901bab52680d0"
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
