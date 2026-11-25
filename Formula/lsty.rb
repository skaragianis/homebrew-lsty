class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.0/lsty-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "43d43ad13372650f04716d45b5a3e2439d9de1cb9958b052725cd610d5c69b77"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.0/lsty-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "2d8b8e59715ba7f269d4c32f427f41298caa887ecfd3c4c58c0f2c15c4430866"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.0/lsty-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c659175d7a6fc18ae6ebb7e2b54c99846aefe3e1cfe6a0e87ac032c8a8b43d1"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.10.0/lsty-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "210fd6d213ea43560211aa172570119bd2b5f69091e66d0b4eefabec42c2a4c8"
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
