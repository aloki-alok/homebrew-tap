cask "mcpify" do
  version "0.5.0"

  on_macos do
    on_intel do
      sha256 "79f3e55912d462b122951ae95d3f54b94516082957fb327da3dff2cdf342a7d9"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_amd64.tar.gz"
    end
    on_arm do
      sha256 "97907811f40f0d87b20492a37865728100d6b14bc25a7c3697e91a2d0d9411f4"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "3130c276e8f41b74a48541fe6099a809d785d38b15af36d0ba8f67709d26a92c"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "406a8df9bc0aecbad37e5f724bb6f4bc3edd84b691b5b2697ecbb47f07bb0bb1"
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
