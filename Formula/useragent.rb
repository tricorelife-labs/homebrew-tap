class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.0/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "5b641a2f4cabdff250c99c29429e5369b9cc2e4a56e31c6ad401c56fddaeb0bc"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.0/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "007f5b258badec06c6384d3b1ba060fcc7583832934b18a30a9f473d5cdf06d5"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
