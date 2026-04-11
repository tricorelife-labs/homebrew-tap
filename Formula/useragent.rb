class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.4/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "5f35e93e16ac4ea2dbfe5528e9e75b1d4be1cdcf42779d03cfe847a5b286c1d1"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.4/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "8a422dba126884f951b5cb9ba0a475a66b6696115faad94bdbe0b1b069527d11"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end