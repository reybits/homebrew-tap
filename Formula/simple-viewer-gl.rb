# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2026 Andrey <https://github.com/reybits>

class SimpleViewerGl < Formula
  desc "Lightweight hardware-accelerated image viewer using OpenGL"
  homepage "https://github.com/reybits/simple-viewer-gl"
  url "https://github.com/reybits/simple-viewer-gl/archive/refs/tags/v3.3.3.tar.gz"
  sha256 "190a881bbff157fdb458fcd38be5090e0488368b4e09bdd35e08c3c45978f3f3"
  license "GPL-2.0-only"
  head "https://github.com/reybits/simple-viewer-gl.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "giflib"
  depends_on "glfw"
  depends_on "jpeg-turbo"
  depends_on "libexif"
  depends_on "libheif"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "openexr"
  depends_on "openjpeg"
  depends_on "webp"
  uses_from_macos "curl"
  uses_from_macos "zlib"

  def install
    system "make", "release"

    prefix.install "Simple Viewer GL.app"
    bin.write_exec_script "#{prefix}/Simple Viewer GL.app/Contents/MacOS/sviewgl"
  end

  def caveats
    <<~EOS
      To link the app to /Applications, run:
        ln -sf '#{prefix}/Simple Viewer GL.app' '/Applications/Simple Viewer GL.app'
    EOS
  end

  test do
    system "#{bin}/sviewgl", "--version"
  end
end
