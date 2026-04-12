class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.9"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.9/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "50428c2331b16fa08e5d1e127419df7a7cf2f51a3d0f1e1bda482bb8408a1ed9"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.9/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "84fb39e798038bc8428e4108306cefdd83c22bcfde3fdae9dd8b28950723ea0a"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
