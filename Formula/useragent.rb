# typed: strict
# frozen_string_literal: true

# Homebrew formula for UserAgent.
class Useragent < Formula
  desc "Powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.5.0-rc.18"

  if OS.mac? && RbConfig::CONFIG["host_cpu"] == "arm64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.18/UserAgent-aarch64-apple-darwin.tar.xz"
    sha256 "d1814baf2a9f9423ba8fbaa7833c05c79d6bd2c10eb7012f14f03a75e1092fb9"
  elsif OS.mac? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.18/UserAgent-x86_64-apple-darwin.tar.xz"
    sha256 "19a00491a6318b24366659dbff539b5c36bf1b61ef351a12ec06fd98fe307a42"
  elsif OS.linux? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.18/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "0e5498e725d6730ebbfe016d2b573a7abfa317901fa0ad2d502c1d3ca4e9a9f3"
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
