class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.6"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.6/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "fddf5cda8041391c597edb6180b8d39495d568bf0261c2e809281ffee2e89fe0"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.6/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "01b3cb5a6641811cdbc5d6e7ea870144871573c5c229619f29b0e1ddfc1691a9"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
