class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.9"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.9/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "a15f68ddc572f7203a7cab77b14d8018a55146c403e8b22011db69ac0fcac4f8"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.9/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "91cfa04aeac0a415c269df6280cc4e54b9464d70bebd55550d14cb8669b60042"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end