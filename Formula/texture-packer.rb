# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2025-2026 Andrey <https://github.com/reybits>

class TexturePacker < Formula
  desc "CLI tool that packs multiple images into optimized texture atlases"
  homepage "https://github.com/reybits/texture-packer"
  url "https://github.com/reybits/texture-packer/archive/refs/tags/v1.3.8.tar.gz"
  sha256 "33c949ea9a396d15558e21180dbf0a5d48c503900d5fefcb72ae086c5f837019"
  license "MIT"
  head "https://github.com/reybits/texture-packer.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "make", "release"
    bin.install "texpacker"
  end

  test do
    assert_match "Texture Packer", shell_output("#{bin}/texpacker 2>&1", 255)
  end
end
