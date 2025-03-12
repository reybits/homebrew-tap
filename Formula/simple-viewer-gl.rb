# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
#
# Author: 2024 Andrey <https://github.com/reybits>

class SimpleViewerGl < Formula
  desc "Simple and tiny image viewer based on OpenGL"
  homepage "https://github.com/reybits/simple-viewer-gl"
  url "https://github.com/reybits/simple-viewer-gl/archive/refs/tags/v3.2.4.tar.gz"
  sha256 "54406af9dda99b30d94f9bf3fe7e21882bb9b14adbad4e8851cc2b628d1ad459" # optional
  head "https://github.com/reybits/simple-viewer-gl.git", branch: "master"
  #   tag:      "v3.2.4",
  #   revision: ""
  # version "3.2.4"
  license "GPL-2.0-only"

  depends_on "cmake" => :build
  depends_on "glfw"
  depends_on "giflib" # recommended
  depends_on "jpeg"
  depends_on "libexif" # recommended
  depends_on "libpng"
  depends_on "libtiff" # recommended
  depends_on "little-cms2" # recommended
  depends_on "openexr" # recommended
  depends_on "openjpeg" # recommended
  depends_on "pkg-config"
  depends_on "webp" # recommended
  uses_from_macos "curl"
  uses_from_macos "zlib"

  def install
    # Build the project using make
    system "make", "release"

    # Copy the .app to the prefix
    prefix.install "Simple Viewer GL.app"

    # Create an executable script for bin
    bin.write_exec_script "#{prefix}/Simple Viewer GL.app/Contents/MacOS/sviewgl"

    # Informational message for the user
    ohai "Optional step: link the app to /Applications for convenience"
    puts <<~EOS
      \tTo link the app to /Applications, run:
      \t\e[32msudo ln -s '#{prefix}/Simple Viewer GL.app' '/Applications/Simple Viewer GL'\e[0m
    EOS

    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    # system "cmake", "--build", "build"
    # system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test simple-viewer-gl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "false"
    system "#{bin}/sviewgl", "--version"
  end
end
