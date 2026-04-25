class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/homebrew-tap"
  version "1.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.5/nba-tv-macos-arm64.tar.gz"
      sha256 "910f3da566dfd7ea230917c2c9f98a51dcfdfa6ca887185f76e781898a805db3"
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
