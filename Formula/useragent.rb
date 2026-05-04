class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.2/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "5cc43537f6333b8c18deac929811d43a7725106dea5f7c10216bb6cb8c033387"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.2/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "69410c857370418fbbdad040f4c8c1836253aeb3de3fb4344d6b130747557059"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end