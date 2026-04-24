class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.11"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.11/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "8c4f8363d6207b7bd59e37bddcb30749dc63db99225dd3b1d463a4ae3a731f45"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.11/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "6a26944b0f5161778fb0b57b09d88786abd2db728a29f76b691188f2b69cbdac"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end