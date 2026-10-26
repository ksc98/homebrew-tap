class Borders < Formula
  desc "Colored window borders for macOS"
  homepage "https://github.com/ksc98/borders"
  url "https://github.com/ksc98/borders.git",
      tag:      "v0.5.8",
      revision: "ab0cd5bc64693a409056fe1dfad0e5bb7727b691"
  license "GPL-3.0-only"
  head "https://github.com/ksc98/borders.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  BUNDLE_ID = "io.github.ksc98.borders".freeze
  # Created by scripts/signing-setup.sh; outside ~/Library/Keychains, which
  # the build sandbox cannot read.
  KEYCHAIN = "#{Etc.getpwuid.dir}/.local/share/borders/signing.keychain-db".freeze
  IDENTITY = "borders local code signing".freeze

  def install
    # An app bundle, so that macOS files the accessibility permission under
    # the bundle id rather than under each version's Cellar path.
    system "cargo", "install", *std_cargo_args(root: libexec)
    contents = prefix/"Borders.app/Contents"
    (contents/"MacOS").install libexec/"bin/borders"
    (contents/"Info.plist").write <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0"><dict>
        <key>CFBundleIdentifier</key><string>#{BUNDLE_ID}</string>
        <key>CFBundleExecutable</key><string>borders</string>
        <key>CFBundleName</key><string>borders</string>
        <key>CFBundlePackageType</key><string>APPL</string>
        <key>CFBundleShortVersionString</key><string>#{version}</string>
        <key>CFBundleVersion</key><string>#{version}</string>
        <key>LSUIElement</key><true/>
      </dict></plist>
    XML
    sign prefix/"Borders.app"
    bin.install_symlink contents/"MacOS/borders"
    man1.install "docs/borders.1"
    bash_completion.install "completions/borders.bash" => "borders"
    fish_completion.install "completions/borders.fish"
    zsh_completion.install "completions/_borders"
    (var/"log/borders").mkpath
    (share/"borders").install "scripts/signing-setup.sh"
  end

  # The permission sticks to the signature: with the local identity one grant
  # survives upgrades, an ad hoc signature needs a new grant per build.
  def sign(bundle)
    if File.exist?(KEYCHAIN) && quiet_system("security", "unlock-keychain", "-p", "", KEYCHAIN)
      system "codesign", "--force", "--keychain", KEYCHAIN, "--sign", IDENTITY, "--identifier", BUNDLE_ID, bundle
    else
      system "codesign", "--force", "--sign", "-", "--identifier", BUNDLE_ID, bundle
    end
  end

  def caveats
    return if File.exist?(KEYCHAIN)

    <<~EOS
      Without a local signing identity, the accessibility permission (Mission
      Control thumbnails, ax_focus) has to be granted again after every upgrade.
      Create one once, then reinstall:
        #{opt_prefix}/share/borders/signing-setup.sh
        brew reinstall borders
    EOS
  end

  service do
    run opt_prefix/"Borders.app/Contents/MacOS/borders"
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
