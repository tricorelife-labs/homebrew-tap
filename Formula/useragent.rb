class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.24"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.24/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "16486b06dc01688094b56b51e95b08cf0eefc7d8f4c935ebf6fa605d8a73fbd2"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.24/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "e626ebda2d807e31fbfca7fddd78e079297f9420c379ad8c5c3ba4be5cc53797"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end