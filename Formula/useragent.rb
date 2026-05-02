class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.21"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.21/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "7f116f7641bdbe2ca21d3f12a3da023e76a38f4b7d29853310d382bc915f8fb1"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.21/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "3ab0cd4fd3e09dd497cd17aef48e6bb3df7dcc7124528fa75d1355667b45a758"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end