class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.0/lsty-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "46769610e211821317cda98028faecf806bbcabedeb8843d1d4bdf3922c4ca07"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.0/lsty-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b78082edfc35317638c978faffc9382054ee012555d135d4f0140fe1aa0ba19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.0/lsty-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "31ac717ed213227b34e4d36a965493318cbaef968af6fece5879b2e859bd0b2c"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.0/lsty-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fb6bc53d0f4f58c8b1a90a99fa31acf30b248547522025f77777203ad81d0a0d"
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
