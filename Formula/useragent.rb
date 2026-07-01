# typed: strict
# frozen_string_literal: true

# Homebrew formula for UserAgent.
class Useragent < Formula
  desc "Powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.5.0-rc.21"

  # DEPRECATED: the useragent CLI now ships inside the useragent-node cask.
  # Install with: brew install --cask tricorelife-labs/tap/useragent-node
  deprecate! date: "2026-07-01", because: "the CLI now ships inside the useragent-node cask"

  if OS.mac? && RbConfig::CONFIG["host_cpu"] == "arm64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.21/UserAgent-aarch64-apple-darwin.tar.xz"
    sha256 "c346d14bacbdf88c75c5b930d9d3e70ce92e22ddffa846d1fd5fb7ed268c758d"
  elsif OS.mac? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.21/UserAgent-x86_64-apple-darwin.tar.xz"
    sha256 "bab320a2192fde9d567c024ed90749d228d2eb08e0c2d3f9216569f985b618fb"
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
