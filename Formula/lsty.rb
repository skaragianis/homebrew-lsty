class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.3.0/lsty-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "8f46716905103888013dd4c6f34c56573dd1bde70f59f691d0acb743b4938746"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.3.0/lsty-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "9b51dc8c2a9f097051ca94ff6059834b85a939a41e77a808f503b0ba3f5de690"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.3.0/lsty-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3a00071814976952af29c4cef5f7047e8b3a03847c82339abc90dd5a5bd133fc"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.3.0/lsty-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "26f4503790c7390196628b30938d8d41be66a88673f454688b1f60d5526c1554"
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
