class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.2/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "7163f6898032b7b2cffa3a238bf7a14a3681f0857201f4d4242d77ae8f664694"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.2/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "40d094c02b5d0751d978fbef37d837beda479c0c47893dc910490462263e2c81"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
