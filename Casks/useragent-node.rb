# typed: strict
# frozen_string_literal: true

# Homebrew cask for the UserAgent Desktop app.
cask "useragent-node" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0-rc.24"
  sha256 arm: "184135b1b0e09b0cd43a76f36e7865c759a0f12e9a24f71a510b17f2bef83b94",
         intel: "dfc6c39750c4042cb9324f8e76e16931fc4744be97986368eb3764f4daaaa8aa"

  url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.24/UserAgent-Node-#{arch}-apple-darwin.dmg",
      verified: "github.com/tricorelife-labs/useragent-releases/"
  name "UserAgent Node"
  desc "Desktop app for running and managing a local UserAgent node"
  homepage "https://github.com/tricorelife-labs/useragent-releases"

  depends_on macos: ">= :big_sur"

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
