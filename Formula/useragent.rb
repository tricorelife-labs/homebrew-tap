class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.23"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.23/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "54d68da6a4d95e377ea79c29d457cb08b122e271a94e8b952d5641b64e052d39"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.23/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "8328be11f2d420cf8e589382c821ab74835bf154722c625a22ad884c3908f97a"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end