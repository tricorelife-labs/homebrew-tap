class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.4/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "c56be8394b85698865a5fc6f46b3f4e702810dbeade8c8c31d66a541d0126642"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.4/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "357fb7573c1007606d2bf6ec5e5e1cca5b5a571058e0c4e62a37347d68fb883a"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end