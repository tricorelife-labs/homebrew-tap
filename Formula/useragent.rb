class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.3/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "c3ec4ac0d66d2316f12cc1b981dbeb0df0ff39db84aaa0b8408cd779495ee180"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.3/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "286a8435662cae56037962b527b04bc0df0e8dbadf6f4b46e9903c8796b36300"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end