# typed: strict
# frozen_string_literal: true

# Homebrew cask for the UserAgent Desktop app.
cask "useragent-node" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0-rc.23"
  sha256 arm: "babdd79addd0d5eb9d1ccf13a827a3ceac18d7e597502cc29d974525c107bc0c",
         intel: "28da5d1ad52bfa1417b2dde2a762af853b4567c718fe98447344f94a02f02df9"

  url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.23/UserAgent-Node-#{arch}-apple-darwin.dmg",
      verified: "github.com/tricorelife-labs/useragent-releases/"
  name "UserAgent Node"
  desc "Desktop app for running and managing a local UserAgent node"
  homepage "https://github.com/tricorelife-labs/useragent-releases"

  depends_on macos: :ventura

  app "UserAgent Node.app"

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
    This cask installs the desktop app only:
      UserAgent Node.app

    If macOS still says the app is damaged, clear Gatekeeper quarantine:
      xattr -dr com.apple.quarantine "/Applications/UserAgent Node.app"

    The CLI command `useragent` is installed by the separate formula:
      brew install tricorelife-labs/tap/useragent

    If an old `useragent` command remains after uninstalling this cask, remove
    the CLI formula separately:
      brew uninstall tricorelife-labs/tap/useragent
      which useragent
  EOS

  zap trash: [
    "~/Library/Application Support/org.jixiai.useragent.desktop",
    "~/Library/Caches/org.jixiai.useragent.desktop",
    "~/Library/Preferences/org.jixiai.useragent.desktop.plist",
  ]
end
