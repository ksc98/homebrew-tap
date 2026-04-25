class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/homebrew-tap"
  version "1.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.3/nba-tv-macos-arm64.tar.gz"
      sha256 "b2d0c62c0e8cb585044a2bfdfaf465912d04c5775e0c1e252d7970066f147d2c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v1.5.3/nba-tv-linux-x86_64.tar.gz"
      sha256 "f88b1656d8f2e8fd2a9fb002703f365d180c1ce04ee6e06015020414010ab2b1"
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
