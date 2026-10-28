class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.0/lsty-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "f93cc97471723f8f2bc0b12be48a7800de1c7a7601999b0e703c3552b6c3fcfc"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.0/lsty-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "8e0e2609f4a3d71bf0651c3cb73b27cffa33c84439ce60c0935acae63fb7c83a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.0/lsty-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f474e3e1153938087d2ed978e9027272893ee67061584d9d6c746835b28c9919"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.6.0/lsty-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0fd55c4ca0931c11d6050388c12a5a2e3d38ad7039fdfe0ef52b85ccedf2d8c2"
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
