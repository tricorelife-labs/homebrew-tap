class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.0/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "7918cfdf6b6c21c24a9a0286cecb816076808ebc7085e81e1579ffb2d39d8d22"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.0/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "f70ec35b2442e048de52734b5b5d35a5b70986aaaf55912be352cd3ef9155cda"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end