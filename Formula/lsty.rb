class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.1.0/lsty-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f0e5974bebcdfa03bc4dd9112b3a4626c37e5892b3425887a882186f0d28e956"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.1.0/lsty-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ddda60de58ad4c8ddd0bc54117f9b43afa48640efb1ac4c82c2c727f5877055d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.1.0/lsty-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "eeb0a6015aaad4213442deb339fe8152bc09613c6e58634103b08e757d4f23c7"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.1.0/lsty-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7c55d3e49732f562cb7686b7dabe62a349a594c2039e6aa5c033382b7c3b714f"
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
