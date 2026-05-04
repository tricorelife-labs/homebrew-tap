class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/UserAgent"
  version "0.4.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.4.2/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "5cc43537f6333b8c18deac929811d43a7725106dea5f7c10216bb6cb8c033387"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.4.2/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "69410c857370418fbbdad040f4c8c1836253aeb3de3fb4344d6b130747557059"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.4.2/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "23b2ae6be82cb2e60a75bbc226988b492144defa67b9a6f3126a071af738b096"
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
