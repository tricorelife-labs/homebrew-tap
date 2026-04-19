class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/UserAgent"
  version "0.3.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.5/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "e050137bbe9b33051ae2d87a382d0c4fb7e05c09832d3fe59cdb96c054c7aac1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.5/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "8c68c3218ff5694f0dd769f21b1bd2f6bb77aef6b0e9c206a15dc6b5dd1c03c7"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.5/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "e7cc9ce26068187a062cfe1cce0ada44309e5db16b213d5128094ad3966cfb68"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
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
