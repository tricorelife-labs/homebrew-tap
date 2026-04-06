class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.1/useragent-cli-aarch64-apple-darwin.tar.gz"
      sha256 "2d875bf3b5f3f4075258e7ad2059688354a625f9c21b36573cfa08ae3d15a921"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.1/useragent-cli-x86_64-apple-darwin.tar.gz"
      sha256 "bc9c9e51c9830819ac08e926c58e60a2426cfcdb7f9ccebb651c293020b803ca"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
