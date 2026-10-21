class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.5.0/lsty-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "67bfc9969419ef2a3e5f237a69bfdb6c35dc6182be560cd24a31f1d9d2c4a93c"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.5.0/lsty-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "15def14958e899a23b22a668ea23bd003510ac4bb20e2bcbe1fbbd87de7c71c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.5.0/lsty-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a6664612e2c45b51b4e247674ad73dc4c5f7987064353081cee4b54fb6016374"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.5.0/lsty-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9b68926600e9d03a49161a51f7d45715ad3df9d07fbdf65b7a38d96a4f7683ef"
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
