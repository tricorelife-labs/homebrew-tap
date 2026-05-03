class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/UserAgent"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.4.0/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "7918cfdf6b6c21c24a9a0286cecb816076808ebc7085e81e1579ffb2d39d8d22"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.4.0/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "f70ec35b2442e048de52734b5b5d35a5b70986aaaf55912be352cd3ef9155cda"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.4.0/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "f40193ec9da51cc8270ea5698fba02c82b345ab041fb42b7e1e159c45536008b"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "axum_server", "cli", "comic_video_generator", "save_image_from_response", "segmented_video_gen",
"server", "test_proxy", "tricore_agent", "useragent-cli"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "axum_server", "cli", "comic_video_generator", "save_image_from_response", "segmented_video_gen",
"server", "test_proxy", "tricore_agent", "useragent-cli"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "axum_server", "cli", "comic_video_generator", "save_image_from_response", "segmented_video_gen",
"server", "test_proxy", "tricore_agent", "useragent-cli"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
