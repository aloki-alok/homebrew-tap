cask "kana" do
  version "0.3.0"
  sha256 "86e1c4a20bdd2f6c9712546bf354c84662a9394e773e63b3174d95189f5a9511"

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
