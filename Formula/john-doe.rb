# Install:  brew tap aloki-alok/tap && brew install --HEAD john-doe
# Upgrade:  brew upgrade --fetch-HEAD john-doe
#
# HEAD-only for now (installs latest main); a versioned URL is added once a tagged release
# is cut. The private source is cloned with your own GitHub credentials.
class JohnDoe < Formula
  desc "Private assistant that talks to you and takes scoped actions on your machine"
  homepage "https://github.com/aloki-alok/john-doe"
  head "https://github.com/aloki-alok/john-doe.git", branch: "main"

  depends_on "uv"

  def install
    # Build a self-contained virtualenv with uv (uv resolves deps, so there are no
    # per-dependency resource stanzas to keep in sync), then link the console script.
    ENV["UV_PROJECT_ENVIRONMENT"] = libexec
    system "uv", "sync", "--no-dev", "--extra", "openai", "--extra", "anthropic"
    bin.install_symlink libexec/"bin/john-doe"
  end

  test do
    assert_match "hello", shell_output("#{bin}/john-doe --demo")
  end
end
