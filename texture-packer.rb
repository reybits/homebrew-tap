# Author: 2025 Uladzimir Kandraciuk <https://github.com/Wl0cKk>
# License: CC0 1.0 Universal

class TexturePacker < Formula
	desc "Texture Packer efficiently packs images into a texture atlas, reducing memory usage and improving rendering performance for games and applications."
	homepage "https://github.com/reybits/texture-packer"
	head "https://github.com/reybits/texture-packer.git", branch: "master"

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
