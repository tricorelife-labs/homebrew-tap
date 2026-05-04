class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.3/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "bd21aaab9d4c6d41a60d0c984b320b6d1809162a5cbdcbd84c35959e419c2ffe"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.3/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "2e0b724202e2ef1eafb1c94632e7ad3984d945a00ea1cd32b99e111714102be1"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end