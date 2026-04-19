class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.5"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.5/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "e050137bbe9b33051ae2d87a382d0c4fb7e05c09832d3fe59cdb96c054c7aac1"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.5/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "8c68c3218ff5694f0dd769f21b1bd2f6bb77aef6b0e9c206a15dc6b5dd1c03c7"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end