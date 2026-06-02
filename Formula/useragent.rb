# typed: strict
# frozen_string_literal: true

# Homebrew formula for UserAgent.
class Useragent < Formula
  desc "Powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.5.0-rc.12"

  if OS.mac? && RbConfig::CONFIG["host_cpu"] == "arm64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.12/UserAgent-aarch64-apple-darwin.tar.xz"
    sha256 "a100a42f9c2d150ccd566062a5170877d76275dcd150b2db61a946f587758d66"
  elsif OS.mac? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.12/UserAgent-x86_64-apple-darwin.tar.xz"
    sha256 "7c9e3336261d5c947f92b925de3902e114074eade70a45c57f191e4d9808adcc"
  end

  def install
    bin.install Dir["**/useragent-cli"].first => "useragent"
    if (axum = Dir["**/axum_server"].first)
      bin.install axum => "axum_server"
    end
    if (opencli_mcp = Dir["**/useragent-opencli-mcp"].first)
      bin.install opencli_mcp => "useragent-opencli-mcp"
    end
    if (cfg = Dir["**/config"].first)
      pkgshare.install cfg => "examples"
    elsif (buildpath/"config").directory?
      pkgshare.install "config" => "examples"
    end
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

      Fleet three-node example:
        cp #{opt_pkgshare}/examples/fleet.three-node.toml.example ~/.useragent/fleet.toml
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/useragent --version 2>&1")
    assert_path_exists bin/"axum_server"
    assert_path_exists bin/"useragent-opencli-mcp"
  end
end
