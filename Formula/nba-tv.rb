class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/homebrew-tap"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.2/nba-tv-macos-arm64.tar.gz"
      sha256 "7aec2700bdaa956d28c0e15ffad30c57df790df7596cb120f75a0b7623a96738"
    end
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.2/nba-tv-macos-x86_64.tar.gz"
      sha256 "ddf359deb25a9acfebcc3581a1174b2d31b90cae9dcf1c32caf689112cf3aa9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.2/nba-tv-linux-arm64.tar.gz"
      sha256 "c346a4cf66b74d8495a588c566bca3ad2450efe3326878ad0c3e96effcba06c6"
    end
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.2/nba-tv-linux-x86_64.tar.gz"
      sha256 "41c6a949703d73e982b37d5c58548cdbb467ab4f6ca7b12fbbe28e54f119e902"
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
