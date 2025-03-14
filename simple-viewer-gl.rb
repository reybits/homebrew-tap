# Author: 2025 Uladzimir Kandraciuk <https://github.com/Wl0cKk>
# License: CC0 1.0 Universal

class SimpleViewerGl < Formula
	desc "Simple Viewer GL is a simple and tiny image viewer based on OpenGL."
	homepage "https://github.com/reybits/simple-viewer-gl"
	url "https://github.com/reybits/simple-viewer-gl/archive/v3.2.1.tar.gz"
	sha256 "54b6d00192dee70d9583ee2aca93299fc36bad8bc5c6c98eb4e69a242c0d48c8" # optional
	head "https://github.com/reybits/simple-viewer-gl.git", branch: "master"

	depends_on "cmake"
	depends_on "glfw"
	depends_on "jpeg"
	depends_on "libpng"
	depends_on "little-cms2"
	depends_on "zlib"
	depends_on "libexif"
	depends_on "libx11"
	depends_on "giflib"
	depends_on "libtiff"
	depends_on "webp"
	depends_on "openexr"
	depends_on "openjpeg"
	depends_on "imlib2"
	depends_on "curl"

	def install
		system "make", "release"
		prefix.install "Simple Viewer GL.app"
		bin.write_exec_script "#{prefix}/Simple Viewer GL.app/Contents/MacOS/sviewgl"
        ohai "(Optional) Please run:"
		puts <<~EOS
			\t\e[32msudo ln -s '#{prefix}/Simple Viewer GL.app' '/Applications/Simpple Viewer GL'\e[0m
		EOS
	end

	test do
		system "#{bin}/sviewgl", "--version"
	end
end
