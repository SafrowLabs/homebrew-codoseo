# Formula template. The release workflow fills in the @...@ placeholders (packaging/render-formula.py)
# and pushes the result to SafrowLabs/homebrew-tap as Formula/codoseo.rb. It installs the prebuilt
# release binaries, so nothing is compiled on the user's machine.
class Codoseo < Formula
  desc "Fast, polite SEO crawler and site auditor"
  homepage "https://codoseo.com"
  version "0.1.0-rc.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/SafrowLabs/CodoSEO/releases/download/v0.1.0-rc.1/codoseo-v0.1.0-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "12d53f7d20b72a772e7c7c0b261bcbf1122cf0619d968b3728b862e8cce2b7cf"
    end
    on_intel do
      url "https://github.com/SafrowLabs/CodoSEO/releases/download/v0.1.0-rc.1/codoseo-v0.1.0-rc.1-x86_64-apple-darwin.tar.gz"
      sha256 "2f2e8640c590f9bf44a5e292524373821fbeb7a7c02294a14f590e4409cd1e1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SafrowLabs/CodoSEO/releases/download/v0.1.0-rc.1/codoseo-v0.1.0-rc.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb4d44a71362f0a0c93c4a108900526e5ba7d87923a00e66216c0fed8963475c"
    end
    on_intel do
      url "https://github.com/SafrowLabs/CodoSEO/releases/download/v0.1.0-rc.1/codoseo-v0.1.0-rc.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "86604e5050ac74b8a124e800fa49bed2ca961845e90c1f8ce0ae1376fa8d7439"
    end
  end

  def install
    bin.install "codoseo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codoseo --version")
  end
end
