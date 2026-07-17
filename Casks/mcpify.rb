cask "mcpify" do
  version "0.6.0"

  on_macos do
    on_intel do
      sha256 "d31e8d7a7c46ef23f1a026fd2123a99fdab8556982aeb13a7639e94ac02bc092"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_amd64.tar.gz"
    end
    on_arm do
      sha256 "a5f929a04ee1f40dfd0f747b5d51dff425207d2db3d86c9cb5c391dc8ffad8bf"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "1dea8b89a3aa100c768b494fda0fb00e336af043f5defdc309d32f2e700b77eb"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "a1b46ee510f01d0e08a3718664ace0ed3fe6b41703d651dbec72a342dde74940"
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
