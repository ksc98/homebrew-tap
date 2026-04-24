class Burnage < Formula
  desc "CLI for your burnage Claude Code usage proxy"
  homepage "https://github.com/ksc98/burnage"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/burnage-v0.1.0/burnage-macos-arm64.tar.gz"
      sha256 "928d28e0eb949cf82eceb30e1672e4623662a650a3f01e69b4cc91d9e502d3d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/burnage-v0.1.0/burnage-linux-x86_64.tar.gz"
      sha256 "463331e9366a04a5841194db5e5480188bbc76288c20e93e4b05603510ee1ba9"
    end
  end

  def install
    bin.install "burnage"
  end

  test do
    assert_match "burnage", shell_output("#{bin}/burnage --help")
  end
end
