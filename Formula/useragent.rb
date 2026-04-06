class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.2/useragent-v0.2.2-aarch64-apple-darwin.tar.xz"
      sha256 "05b95d658798265fa8abe8d024790b75b67179fd92ac5f87ae7163a9f1640859"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.2/useragent-v0.2.2-x86_64-apple-darwin.tar.xz"
      sha256 "fa408c2657efa75dec5d1d98b38f55af1aa0c2e416fbdd333dd74120507960a9"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end