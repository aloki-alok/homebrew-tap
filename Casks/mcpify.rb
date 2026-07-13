cask "mcpify" do
  version "0.4.0"

  on_macos do
    on_intel do
      sha256 "3e3a269b622e242d26df589578885917fed4be3ffee103afbd607c3becc3b0c1"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_amd64.tar.gz"
    end
    on_arm do
      sha256 "857e782bb7610daef147e35e12fdd4ed11d56283eec771822ac3f4aa9a7548aa"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "7d787ed8b876ce1053e90de1e851ac88a6a5b644627b95b9a71b1bf0328bbf44"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "4dfc2a113c43dccb1711b6832b173a47be20db1a39dbdd363ce2480e4dc56d40"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_linux_arm64.tar.gz"
    end
  end

  name "mcpify"
  desc "Turn any OpenAPI 3.x spec into a working MCP server in one command."
  homepage "https://github.com/aloki-alok/mcpify"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "mcpify"

  postflight do
    if system_command("/usr/bin/xattr", args: ["-h"]).exit_status == 0
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/mcpify"]
    end
  end

  # No zap stanza required

end
