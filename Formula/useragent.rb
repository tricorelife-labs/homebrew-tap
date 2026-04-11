class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.6/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "ad4b091b76e720e164b00a2a8f1b786614fcb3141365dd730bc6a4e655869e1e"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.6/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "7d7f0641a57f87bb59e43b7894c6c722dbefc902b02fee747232c9bedabd9e62"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
