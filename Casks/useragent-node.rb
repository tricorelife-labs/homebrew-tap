# typed: strict
# frozen_string_literal: true

# Homebrew cask for the UserAgent Desktop app.
cask "useragent-node" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0-rc.21"
  sha256 arm: "5714d792eb51c8cc16a2be6605019f1448c4659df6db9441d253d063f70d78a2",
         intel: "6ec468a8a78476cb56afad9f81f6cfdb89be68469d40d96138824c4683da0a12"

  url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.21/UserAgent-Node-#{arch}-apple-darwin.dmg",
      verified: "github.com/tricorelife-labs/useragent-releases/"
  name "UserAgent Node"
  desc "Desktop app for running and managing a local UserAgent node"
  homepage "https://github.com/tricorelife-labs/useragent-releases"

  depends_on macos: ">= :ventura"

  app "UserAgent Node.app"

  zap trash: [
    "~/Library/Application Support/org.jixiai.useragent.desktop",
    "~/Library/Caches/org.jixiai.useragent.desktop",
    "~/Library/Preferences/org.jixiai.useragent.desktop.plist",
  ]
end
