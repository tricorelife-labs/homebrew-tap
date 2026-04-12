class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.7/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "71b75b6ddd39856c1e6ef8aca30873d81f75ccea9d1efaf20b32e7eca06624e0"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.2.7/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "d4ed55cf0ae062f396c244172aae38e8eff0fc3af5d7660e569b66eaffee25d2"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end
