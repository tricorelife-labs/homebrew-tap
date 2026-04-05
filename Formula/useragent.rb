class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.0/useragent-v0.2.0-aarch64-apple-darwin.tar.xz"
      sha256 "c64a05064e0b3c3f81e28a4185d93319665de8ce9528643b532165059c635bd7"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.0/useragent-v0.2.0-x86_64-apple-darwin.tar.xz"
      sha256 "cebcc63c2a5de32bdcc27024df843d3d1c55af4575be34df006070380cfea627"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
