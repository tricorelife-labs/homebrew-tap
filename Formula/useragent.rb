# typed: strict
# frozen_string_literal: true

# Homebrew formula for UserAgent.
class Useragent < Formula
  desc "Powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/useragent-releases"
  version "0.5.0-rc.3"

  if OS.mac? && RbConfig::CONFIG["host_cpu"] == "arm64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.3/UserAgent-aarch64-apple-darwin.tar.xz"
    sha256 "c9bd0cd47fc670cc7f93b9d73f3640bdebe2fd859808ff212df05a98df6173b5"
  elsif OS.mac? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v0.5.0-rc.3/UserAgent-x86_64-apple-darwin.tar.xz"
    sha256 "991ed69fcd51ed6ac7265c4826b4db7489044b185b0bbce85174418ff6e1c3ae"
  end

  def install
    bin.install Dir["UserAgent-*/useragent-cli"].first => "useragent"
    if (axum = Dir["UserAgent-*/axum_server"].first)
      bin.install axum => "axum_server"
    end
    if (cfg = Dir["UserAgent-*/config"].first)
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
  end
end
