# typed: strict
# frozen_string_literal: true

# Homebrew formula for UserAgent.
class Useragent < Formula
  desc "Powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.5.0-rc.20"

  if OS.mac? && RbConfig::CONFIG["host_cpu"] == "arm64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.20/UserAgent-aarch64-apple-darwin.tar.xz"
    sha256 "049e75c25a74fd5d92154265832005a24e839670e2b36be099b16eac5958282c"
  elsif OS.linux? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.20/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "970307fe7bb9fb41b59e10a9b05be2f7781b20d5becef6c74863c3e03ac33762"
  end

  def install
    bin.install Dir["UserAgent-*/useragent-cli"].first => "useragent"
    if (axum = Dir["UserAgent-*/axum_server"].first)
      bin.install axum => "axum_server"
    end
    if (opencli_mcp = Dir["UserAgent-*/useragent-opencli-mcp"].first)
      bin.install opencli_mcp => "useragent-opencli-mcp"
    end
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
