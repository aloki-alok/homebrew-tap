cask "mcpify" do
  version "0.6.1"

  on_macos do
    on_intel do
      sha256 "1259e9bb27cec6a3879ad46175f04e1a635f4b2fe602de838fdd67ea52078471"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_amd64.tar.gz"
    end
    on_arm do
      sha256 "a6b7efb72de9990c979e5e9eb49d5e6e3eb3b1ccb5413754cb9f482f7c68e25d"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "2240cecf37a8c799067e7d1626d455728f1c7e92e9821522b54825e8059fe493"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "db7ec2dcf59e78acc34141be9ca6a8addff6de639437015e3b51ad536d1b1190"
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
