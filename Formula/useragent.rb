class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.1/useragent-v0.2.1-aarch64-apple-darwin.tar.xz"
      sha256 "2392a9c69a8e1381bffe030647c1a056c441a91bfb9b6e8f87f2ce595d28b43f"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.1/useragent-v0.2.1-x86_64-apple-darwin.tar.xz"
      sha256 "d12dc97a1e67e2e16720d84d0c61b14f4aace716f5db4428cf23862c3e29d687"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end