class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.1/lsty-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "ebfe07be0823a0df376a1d6cfb0acd2fd4c694016f79dde6e2f9ea87046892c0"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.1/lsty-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "581f5d9160d13137aaf446b09a94d2aea84294b0a05a36f70f11758b9282f9fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.1/lsty-v0.10.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "58c8a87c2a3e83d253e253faf9bc53f5383734f5a91fb0afb3df345305682197"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.1/lsty-v0.10.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "31652df06162fee6b6e86e2ae0bd46b5f309c363c3986df745ccd3fb91e23932"
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
