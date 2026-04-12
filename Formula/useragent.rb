class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.6/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "df246af6ef75d4a9d184efe430cea6b0ad14ff26b868e3113c9d778890e87fb8"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.6/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "2c3b7c603aeaf3e090e5ef9410bbad0935f1ac3bdffae0feb74c774bb23435d6"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end