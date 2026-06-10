# typed: strict
# frozen_string_literal: true

# Homebrew formula for whywechat (macOS Apple Silicon).
# Served from the public release mirror because the source repo is private.
class Whywechat < Formula
  desc "Local-first WeChat data pipeline and CLI"
  homepage "https://github.com/tricorelife-labs/whywechat-releases"
  version "0.2.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tricorelife-labs/whywechat-releases/releases/download/v#{version}/whywechat-v#{version}-macos-arm64.zip"
    sha256 "c7e5ac454137f1fd870b26e1b4ce8d960353ea4364137582f81aac10f51e1e8b"
  else
    odie "whywechat currently ships macOS Apple Silicon binaries only (use Scoop on Windows)"
  end

  def install
    # Homebrew strips the single top-level `macos/` dir during staging, and
    # the binaries live under the hidden `.local/bin/` — `**` skips hidden
    # dirs unless FNM_DOTMATCH is set, so glob with it.
    %w[wx wx-watcher wx-pipeline wx-api].each do |name|
      src = Dir.glob("**/#{name}", File::FNM_DOTMATCH).find { |p| File.file?(p) }
      odie "binary #{name} not found in archive" unless src
      bin.install src => name
    end
    if (notice = Dir.glob("**/NOTICE", File::FNM_DOTMATCH).first)
      prefix.install notice
    end
  end

  def caveats
    <<~EOS
      One-time macOS setup:
        codesign --force --deep --sign - /Applications/WeChat.app
        restart WeChat
        sudo wx init

      Start the local API + dashboard:
        wx-pipeline init --wxid <your_wxid>
        wx-pipeline backfill
        wx-pipeline serve            # http://127.0.0.1:8765/
    EOS
  end

  test do
    system "#{bin}/wx-api", "--help"
    system "#{bin}/wx-pipeline", "--help"
  end
end
