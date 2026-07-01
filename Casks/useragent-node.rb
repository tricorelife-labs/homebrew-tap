# typed: strict
# frozen_string_literal: true

# Homebrew cask for the UserAgent Desktop app.
cask "useragent-node" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0-rc.25"
  sha256 arm: "ab6eef26269580bf08d0d312cc5086a0fbc86206d3ccbffc0650ddbf06bd3be1",
         intel: "6549fc1ee754eadb1578d14dd51e1427423685e4fb9fa556c502e704b19a8625"

  url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.25/UserAgent-Node-#{arch}-apple-darwin.dmg",
      verified: "github.com/tricorelife-labs/useragent-releases/"
  name "UserAgent Node"
  desc "Desktop app and CLI for running and managing a local UserAgent node"
  homepage "https://github.com/tricorelife-labs/useragent-releases"

  depends_on macos: :big_sur

  app "UserAgent Node.app"

  # Ship the `useragent` CLI from inside the app bundle, so one install gives
  # both the desktop app AND the CLI. The desktop app bundles useragent-cli as a
  # Tauri externalBin, which lands in Contents/MacOS/.
  binary "#{appdir}/UserAgent Node.app/Contents/MacOS/useragent-cli", target: "useragent"

  # Temporary until the desktop DMG is Developer ID signed and notarized.
  # Without this, Gatekeeper reports the unsigned Homebrew-downloaded app as
  # damaged because Homebrew preserves the download quarantine attribute.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/UserAgent Node.app"],
                   print_stdout: false,
                   print_stderr: false
  end

  caveats <<~EOS
    This cask installs BOTH:
      UserAgent Node.app          (the desktop app)
      useragent                   (the CLI, symlinked from inside the app bundle)

    If macOS still says the app is damaged, clear Gatekeeper quarantine:
      xattr -dr com.apple.quarantine "/Applications/UserAgent Node.app"

    The standalone `useragent` formula is DEPRECATED and superseded by this cask
    (the CLI now ships inside the app). If you previously installed it, remove it
    so the two do not fight over the `useragent` command:
      brew uninstall tricorelife-labs/tap/useragent
      which useragent
  EOS

  zap trash: [
    "~/Library/Application Support/org.jixiai.useragent.desktop",
    "~/Library/Caches/org.jixiai.useragent.desktop",
    "~/Library/Preferences/org.jixiai.useragent.desktop.plist",
  ]
end
