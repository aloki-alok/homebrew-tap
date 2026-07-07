# Canonical source for the Homebrew formula. The tap repo (aloki-alok/homebrew-tap)
# carries a copy of this file. Update both together; each release is just a tag bump.
#
# Install:  brew tap aloki-alok/tap && brew install john-doe
# Upgrade:  brew upgrade john-doe
#
# The private source is cloned with the user's own GitHub credentials.
class JohnDoe < Formula
  desc "Private assistant that talks to you and takes scoped actions on your machine"
  homepage "https://github.com/aloki-alok/john-doe"
  url "https://github.com/aloki-alok/john-doe.git",
      using: :git,
      tag:   "v0.1.0"
  version "0.1.0"
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
