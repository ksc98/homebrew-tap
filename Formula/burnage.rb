class Burnage < Formula
  desc "CLI for your burnage Claude Code usage proxy"
  homepage "https://github.com/ksc98/burnage"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ksc98/homebrew-tap/releases/download/burnage-v0.2.0/burnage-macos-arm64.tar.gz"
      sha256 "4782c4b70c7645889ca086dfb4742f7367162511a0b4366bcfc75759417adafe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ksc98/homebrew-tap/releases/download/burnage-v0.2.0/burnage-linux-x86_64.tar.gz"
      sha256 "ed2f84677d20241aa3196fe428ac67c2acb6974af2500022a4af5da0de41f35c"
    end
  end

  def install
    bin.install "burnage"
  end

  test do
    assert_match "burnage", shell_output("#{bin}/burnage --help")
  end
end
