class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.3/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "a2e9ae6880b334d8cc8a27a4828aac7cff145c7e3705c09e5e9a6cea3e00bb7c"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.3/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "8751b91a15a7c9fd8f83e68c864dc64abb3149fa4c7323b8c2908c9c19c7749e"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
