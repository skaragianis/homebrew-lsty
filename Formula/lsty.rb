class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.2.0/lsty-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "ac8d24e4ea3deb8a177db6c7495e1d28d75c6bdd6a033bc3b39b2d3a841b468e"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.2.0/lsty-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "d2e4d7a1013605a30046a0dcc2ddaf571539da600f401d1e0d421d2909c19302"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.2.0/lsty-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "53c24c6897cf9de2e3b53efe7b53db0f739ef05acd203118d769bd0b9881e4ba"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.2.0/lsty-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bf66f04d46b97f8b90eccb0fb6a11894df071ab354c090e14b9ca4555f9b048c"
    end
  end

  def install
    bin.install "lsty"
    doc.install Dir["THIRD-PARTY-LICENSES*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lsty --version")
    (testpath/"todo.txt").write ""
    system bin/"lsty", "--no-config", "--file", "todo.txt", "add", "Brewed +lsty", "--human"
    assert_match "Brewed +lsty", (testpath/"todo.txt").read
  end
end
