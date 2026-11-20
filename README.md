# homebrew-tap

Personal Homebrew tap.

## Install

```
brew install ksc98/tap/eightsleep
```

Or tap first and trust the tap, then install by short name (Homebrew refuses
short names from an untrusted third-party tap):

```
brew tap ksc98/tap
brew trust ksc98/tap
brew install eightsleep
```

## Formulae

- [`eightsleep`](Formula/eightsleep.rb): `8sleep`, command-line control for the Eight Sleep Pod ([ksc98/8sleep-cli](https://github.com/ksc98/8sleep-cli); source build)
- [`itop`](Formula/itop.rb) — `top` for iPhone, iPad, Vision Pro and Apple TV over USB or Wi-Fi (source build; needs GitHub access to the private `ksc98/itop`)
- [`borders`](Formula/borders.rb): colored window borders for macOS (source build; needs GitHub access to the private `ksc98/borders`)
- [`burnage`](Formula/burnage.rb): CLI for the burnage Claude Code usage proxy (prebuilt binary from this tap's releases)
