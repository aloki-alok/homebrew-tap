cask "mcpify" do
  version "0.2.0"

  on_macos do
    on_intel do
      sha256 "5e0aa68125d76e469bed41866d8b0808a2932d17da1165d99b5de7e033578311"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_amd64.tar.gz"
    end
    on_arm do
      sha256 "7734372915bd3107b74b79f6928ad93cc96d0d37de43a9255aae71fc4d478465"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "460e61e3745f72cb877ac14e49ff0e39abc16d042612ce4671b54942af8632f9"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "1a68309be718506cdf15b728de95adce0f68fb41fc790e0c3efc460d06def6f5"
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
