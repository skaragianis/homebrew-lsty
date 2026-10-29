class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.1/lsty-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "075b84bcb7ad2ee9ef0321affd0b7acfed6f986f48cceeb1ee1539a272e2b513"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.1/lsty-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "7ccf8fc5b7ca3062e1817d798759fa0b751298734b63711f8585b436ca59a68a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.1/lsty-v0.6.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ca06a92d43204e33ec6b6fa0a7110664dd29bf6d6c6d0943186ef4e6486f85da"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.1/lsty-v0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "83cc5700ee52066072754eb4d0f15badcdb7ba4c6fe9981fb2c593d065b1f029"
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
