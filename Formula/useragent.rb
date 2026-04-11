class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.5/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "64703a43fadced2c20e1ca3481ce22f3e187428323292186d2acf0ac9429bf77"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.5/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "d548a6a660b82591be444018b1bb52c0b345c488c530287c2659f923c977099a"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
