class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.7"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.7/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "5d2701fc9fa6d1bcc1ec2614dc7279ce3b8a2e2df2ef8e21af66e28cca651fe8"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.7/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "2a01a58a1192f084a999d7ba179a11fffe2296da899bb1ad1acf90ad2a8bbaed"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end