class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/homebrew-tap"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.3/nba-tv-macos-arm64.tar.gz"
      sha256 "f29293a3c03603054b61c79118e89b27011372b74d09947407729cccb1bbebf6"
    end
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.3/nba-tv-macos-x86_64.tar.gz"
      sha256 "47d3c0bdbd9008db9f503791816589817c836097d1d4cf5956cb82a78a1c76b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.3/nba-tv-linux-arm64.tar.gz"
      sha256 "b068fa7531281260662bddad98b2c40ee420136f906e74bf5561741ded1820cb"
    end
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v0.1.3/nba-tv-linux-x86_64.tar.gz"
      sha256 "738594479d626040f0fdc36059e6598b901589e822eca461453fbcc0d28012b0"
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
