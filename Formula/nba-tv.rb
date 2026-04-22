class NbaTv < Formula
  desc "Watch NBA streams in mpv from your terminal"
  homepage "https://github.com/ksc98/nba-tv"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/nba-tv/releases/download/v0.1.0/nba-tv-macos-arm64.tar.gz"
      sha256 "14d9a75fe9c9615a071642e971c49f6dd6cd8dc776928ac9f91cde928f8d47d5"
    end
  end

  depends_on "mpv"
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "nba-tv"
  end

  test do
    assert_match "nba-tv", shell_output("#{bin}/nba-tv --help")
  end
end
