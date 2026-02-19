# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2025-2026 Andrey <https://github.com/reybits>

class TexturePacker < Formula
  desc "CLI tool that packs multiple images into optimized texture atlases"
  homepage "https://github.com/reybits/texture-packer"
  url "https://github.com/reybits/texture-packer/archive/refs/tags/v1.3.7.tar.gz"
  sha256 "2a3c78d8f6f8791bcbd73accf67d404432b78a629bb3be765a84bfb1d169092d"
  head "https://github.com/reybits/texture-packer.git", branch: "master"
  license "MIT"

  depends_on "cmake" => :build

  def install
	system "make", "release"
	bin.install "texpacker"
  end

  test do
	assert_match "Texture Packer", shell_output("#{bin}/texpacker 2>&1", 255)
  end
end
