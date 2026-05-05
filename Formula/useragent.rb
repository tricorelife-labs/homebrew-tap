# typed: strict
# frozen_string_literal: true

# Homebrew formula for UserAgent.
class Useragent < Formula
  desc "Powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.4.4"

  if OS.mac? && RbConfig::CONFIG["host_cpu"] == "arm64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.4/UserAgent-aarch64-apple-darwin.tar.xz"
    sha256 "401c102f35f419fcd27a55e711d3740eefd68a0c85d186b34279ffe2ba714600"
  elsif OS.mac? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.4/UserAgent-x86_64-apple-darwin.tar.xz"
    sha256 "56ad4158271ff0fe546a6ace18aeb051d4f470f622555e4d0faa36e2a959f308"
  elsif OS.linux? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.4.4/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "2cdf1b32463dc5997e445e964434aac2050b66e569f5ff60a8ec78f0e76207dc"
  end

  def install
    bin.install "useragent-cli" => "useragent"
    pkgshare.install "config" => "examples" if (buildpath/"config").directory?
  end

  def caveats
    <<~EOS
      Example mesh configs are installed to:
        #{opt_pkgshare}/examples

      To initialize the M4 provider config:
        mkdir -p ~/.useragent
        cp #{opt_pkgshare}/examples/mesh.m4-provider.toml.example ~/.useragent/mesh.toml

      To initialize an Intel consumer config:
        mkdir -p ~/.useragent
        cp #{opt_pkgshare}/examples/mesh.intel-consumer.toml.example ~/.useragent/mesh.toml
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
  end
end