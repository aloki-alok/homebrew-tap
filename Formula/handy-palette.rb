class HandyPalette < Formula
  desc "Kaomoji and emoji picker with clipboard history for macOS"
  homepage "https://github.com/aloki-alok/handy-palette"
  url "https://github.com/aloki-alok/handy-palette.git",
      using:    :git,
      tag:      "v0.1.0",
      revision: "7d2fac4e3d339f58fc044fefeb5aab1d5149f36d"
  license "MIT"
  head "https://github.com/aloki-alok/handy-palette.git", branch: "main"

  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    libexec.install ".build/release/Handy" => "handy-palette"
    libexec.install ".build/release/HandyChecks"
    libexec.install ".build/release/Handy_HandyCore.bundle"
    bin.write_exec_script libexec/"handy-palette"
  end

  service do
    run [opt_bin/"handy-palette"]
    keep_alive crashed: true
    process_type :interactive
  end

  test do
    assert_match "Handy Palette 0.1.0", shell_output("#{bin}/handy-palette version")
    system libexec/"HandyChecks"
  end
end
