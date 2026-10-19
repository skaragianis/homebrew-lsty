class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.4.0/lsty-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "9b82b459f88701a9944f4c281e071e04961a0c78a402ae517ee98651e7ab7e07"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.4.0/lsty-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a5bab79edb5e5e22016be76af5d96f7b7afd296c68d6e9ab361d6ed019d1b77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.4.0/lsty-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a7790a8f1e732d2ee18038ff2e4f8d8499b923768dd79224d9d05431bb758613"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.4.0/lsty-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4010adbb644f721ddb958000565eafd3fb9a57852076c49a96f3213030354b5b"
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
