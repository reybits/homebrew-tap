# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2025-2026 Andrey <https://github.com/reybits>

class TexturePacker < Formula
  desc "CLI tool that packs multiple images into optimized texture atlases"
  homepage "https://github.com/reybits/texture-packer"
  url "https://github.com/reybits/texture-packer/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "ad10f7f73134b9a2c6c302f3a135b775812dfdff87c20f876837228a56165f7d"
  license "MIT"
  head "https://github.com/reybits/texture-packer.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "make", "release"
    bin.install "texpacker"
  end

  test do
    assert_match "Texture Packer", shell_output("#{bin}/texpacker 2>&1")
  end
end
