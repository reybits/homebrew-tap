# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2026 Andrey <https://github.com/reybits>

class SimpleViewerGl < Formula
  desc "Lightweight hardware-accelerated image viewer using OpenGL"
  homepage "https://github.com/reybits/simple-viewer-gl"
  url "https://github.com/reybits/simple-viewer-gl/archive/refs/tags/v3.3.1.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  head "https://github.com/reybits/simple-viewer-gl.git", branch: "master"
  license "GPL-2.0-only"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glfw"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  uses_from_macos "curl"
  uses_from_macos "zlib"

  # recommended optional deps — all available via Homebrew
  depends_on "giflib"
  depends_on "libexif"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "openexr"
  depends_on "libheif"
  depends_on "openjpeg"
  depends_on "webp"

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
