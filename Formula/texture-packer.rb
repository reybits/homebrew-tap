# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2025 Andrey <https://github.com/reybits>

class TexturePacker < Formula
  desc "Texture Packer efficiently packs images into a texture atlas, reducing memory usage and improving rendering performance for games and applications."
  homepage "https://github.com/reybits/texture-packer"
  url "https://github.com/reybits/texture-packer/archive/refs/tags/v1.3.6.tar.gz"
  sha256 "e90d8fe1a619e8690ee186e61c8a0af07c9054e119c764d390ae48a4e203083b" # optional
  head "https://github.com/reybits/texture-packer.git", branch: "master"
  #   tag:      "v3.2.4",
  #   revision: ""
  # version "3.2.4"
  license "MIT"

  depends_on "cmake" => :build

  def install
	system "make", "clean"
	system "make", "release"
	bin.install "texpacker"
  end

  test do
	system "#{bin}/texpacker", "--version"
  end
end
