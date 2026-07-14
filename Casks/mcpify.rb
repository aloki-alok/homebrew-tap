cask "mcpify" do
  version "0.5.1"

  on_macos do
    on_intel do
      sha256 "060e40acb01af5eabdd76f124fc015efc8dcae0fcaa5874bdf524d1112fcea2d"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_amd64.tar.gz"
    end
    on_arm do
      sha256 "e10a3974510bb2f0d36e49644c77b2ba8532f2e2ad699e745b68b31497de8e3b"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_darwin_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "5ea4cbd3023d627bdcdf87e3254dd69f9996c9d516d6ec7eb55cd1add6dc0ea9"
      url "https://github.com/aloki-alok/mcpify/releases/download/v#{version}/mcpify_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "1a0f9972095319c96cdbafd5ab38babdc545fb6da0456cead47fdb45ef8e0a10"
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
