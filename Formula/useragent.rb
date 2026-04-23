class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.3.8"

  on_macos do
    on_arm do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.8/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "ababe5ca97d811e8a1c08e1a51f8bd2839d042944084a3472e9f9db31039385b"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
    on_intel do
      url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.3.8/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "40d960fbbc6a76902e780bd2562f5d82f375bc015dadc1582df01e3014429c9c"

      def install
        bin.install "useragent-cli" => "useragent"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end