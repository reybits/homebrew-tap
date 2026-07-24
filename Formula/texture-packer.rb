# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2025-2026 Andrey <https://github.com/reybits>

class TexturePacker < Formula
  desc "CLI tool that packs multiple images into optimized texture atlases"
  homepage "https://github.com/reybits/texture-packer"
  url "https://github.com/reybits/texture-packer/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "6cfc9554e30ec4f62b169c2c38ffc317e94b781ea0e2e5066bbcd1b64657eb99"
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
