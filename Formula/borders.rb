class Borders < Formula
  desc "Colored window borders for macOS"
  homepage "https://github.com/ksc98/borders"
  url "https://github.com/ksc98/borders.git",
      tag:      "v0.2.0",
      revision: "9683dc9bc8043b07166670d12a6086798b229f34"
  license "GPL-3.0-only"
  head "https://github.com/ksc98/borders.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "docs/borders.1"
    bash_completion.install "completions/borders.bash" => "borders"
    fish_completion.install "completions/borders.fish"
    zsh_completion.install "completions/_borders"
    (var/"log/borders").mkpath
  end

  service do
    run opt_bin/"borders"
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive successful_exit: false
    process_type :interactive
    log_path var/"log/borders/borders.out.log"
    error_log_path var/"log/borders/borders.err.log"
  end

  test do
    assert_match(/^borders \d/, shell_output("#{bin}/borders --version"))
    assert_match "unknown option", shell_output("#{bin}/borders bogus=1 2>&1", 2)
  end
end
