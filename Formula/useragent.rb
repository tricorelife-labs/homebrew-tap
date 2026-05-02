class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/UserAgent"
  version "0.3.21"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.21/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "7f116f7641bdbe2ca21d3f12a3da023e76a38f4b7d29853310d382bc915f8fb1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.21/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "3ab0cd4fd3e09dd497cd17aef48e6bb3df7dcc7124528fa75d1355667b45a758"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.21/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "3425de8756c7cd66b69d7e21eb7e0cb4a0a6640aed3fa6b5dafe849ad52b5d8c"
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
