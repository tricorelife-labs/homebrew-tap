class Useragent < Formula
  desc "A powerful AI agent CLI with multi-model support and tool use"
  homepage "https://github.com/tricorelife-labs/UserAgent"
  version "0.3.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.7/UserAgent-aarch64-apple-darwin.tar.xz"
      sha256 "5d2701fc9fa6d1bcc1ec2614dc7279ce3b8a2e2df2ef8e21af66e28cca651fe8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.7/UserAgent-x86_64-apple-darwin.tar.xz"
      sha256 "2a01a58a1192f084a999d7ba179a11fffe2296da899bb1ad1acf90ad2a8bbaed"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tricorelife-labs/UserAgent/releases/download/v0.3.7/UserAgent-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "adbc66876bdecdc908db899221af286b1890fcacd997511905495e07c23f0842"
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
