class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.1/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "324686a803b9abc342a9b074e444590c623049fae1896ce4559142563a9794fc"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.1/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "fb1f6507e1b018571726dfec32cc6d642eac1b63d33a707f40d8201ec5fa698a"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end