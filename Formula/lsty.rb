class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.1/lsty-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "33ad4ff7e17557eed1709c3831ceabcc2a605c0f4f9876b95b7bf3e7bf2ff80e"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.1/lsty-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "d292862ed056fafeb5eade98c9e53529e7ecaf1dbf808675bebd1f75c98d5a6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.1/lsty-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "819f07559cbb9379983bb1b595a15a957f0aa7d28017923c0f3115437940b1b0"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.1/lsty-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67e4387b35fe9fddf905df7afdced4dea8b22f13e96a48a9f1959fd4e6b1e150"
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
