class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.1/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "446267aae9001c9978b968a8e3f3cc027c64164db8e676f908369555636f9e53"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.1/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "0b0e8fdfd7c4f0b51f5038f60dfaf9b577494569b8846e2c233b2b37d85794ef"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
