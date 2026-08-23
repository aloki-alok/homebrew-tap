cask "kana" do
  version "0.3.3"
  sha256 "8240b89150084eb27e2b50ecfc59946988664be06ca1c192cb98be340afc9227"

  url "https://github.com/aloki-alok/kana/releases/download/v#{version}/Kana-#{version}-arm64.zip"
  name "Kana"
  desc "Kaomoji and emoji picker with clipboard history"
  homepage "https://github.com/aloki-alok/kana"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Kana.app"
  binary "#{appdir}/Kana.app/Contents/Helpers/kana"

  # The community build is ad-hoc signed rather than notarized, so clear the
  # download flag the same way the other casks in this tap do.
  postflight do
    if system_command("/usr/bin/xattr", args: ["-h"]).exit_status.zero?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Kana.app"]
    end
  end

  zap trash: [
    "~/Library/Application Support/Kana",
    "~/Library/Preferences/io.github.aloki-alok.kana.shared.plist",
  ]

  caveats do
    <<~EOS
      Kana is ad-hoc signed, not notarized. If macOS still refuses to open it,
      open it once, then choose Open Anyway in System Settings > Privacy & Security.

      Turn on Open at login from the menu-bar menu. Press Option-Command-K to open it.
    EOS
  end
end
