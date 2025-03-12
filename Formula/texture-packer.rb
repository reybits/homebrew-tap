# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2025 Andrey <https://github.com/reybits>

class TexturePacker < Formula
  desc "Texture Packer efficiently packs images into a texture atlas, reducing memory usage and improving rendering performance for games and applications."
  homepage "https://github.com/reybits/texture-packer"
  url "https://github.com/reybits/texture-packer/archive/refs/tags/v1.3.6.tar.gz"
  # sha256 "54406af9dda99b30d94f9bf3fe7e21882bb9b14adbad4e8851cc2b628d1ad459" # optional
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
