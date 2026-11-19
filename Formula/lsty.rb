class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.8.0/lsty-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "873504d7873fa8eeb83df6f318b5309c209c76faf4cbfa6b251cc002fecb47bf"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.8.0/lsty-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "2a1b0f7cc6c9e8a82bab01e7bb902b50588b1dcdec5735c05b667c5b4f45cb82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.8.0/lsty-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "578848a19f31e8bd2d6e88fe08af14e2d8adb5470817bbf32d635c3b5091a235"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.8.0/lsty-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2ff04c71e0dc731f0712b6abe12ce6c36c4f11847ddf92bbe41a8e662d1d8510"
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
