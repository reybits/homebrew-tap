# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2026 Andrey <https://github.com/reybits>

class SimpleViewerGl < Formula
  desc "Lightweight hardware-accelerated image viewer using OpenGL"
  homepage "https://github.com/reybits/simple-viewer-gl"
  url "https://github.com/reybits/simple-viewer-gl/archive/refs/tags/v3.3.2.tar.gz"
  sha256 "43f31b5e105fdfc5a62d47812cd5e69c10ae05f5dc1aa6723f2160ca19b719a5"
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
