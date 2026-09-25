class Itop < Formula
  desc "Stats and logs for any Apple device (iPhone, iPad, Vision Pro, Apple TV) over USB or Wi-Fi"
  homepage "https://github.com/ksc98/itop"
  # ksc98/itop is private: a source build from git, cloned with your GitHub
  # credentials (`gh auth login` + gh's git credential helper, or any other).
  url "https://github.com/ksc98/itop.git", tag: "v0.2.3", revision: "960f56c9bae00c336c92d9570fc05b869b3fe132"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/ksc98/itop.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Pair once over USB (device unlocked, tap Trust): itop pair
      From a third-party terminal (iTerm2, Ghostty, ...) allow it under
      System Settings > Privacy & Security > Local Network for Wi-Fi devices.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/itop --version")
  end
end
