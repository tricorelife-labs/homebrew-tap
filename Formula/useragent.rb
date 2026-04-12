class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.8"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.8/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "d19c790c4a3480bd5cf2fbaa67758ac292c2582eb5b4fe29554929c55203dbd0"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.8/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "7f812e37b5d64e4660ea9782b9eaa2cd2bd463cdecefe6fff20182fb79839589"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
