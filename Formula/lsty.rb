class Lsty < Formula
  desc "Terminal lists for Humans and Agents"
  homepage "https://github.com/skaragianis/lsty"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.2/lsty-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "f61e08e31ed0c21273e42ff06afa7f174d7e3b6f8831469fee8cea9396c0f2bf"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.2/lsty-v0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "1fb7591c05d5bb8f301a4b430f88bbd712c70977ac796e2538095731cc57651d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.2/lsty-v0.7.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c1b2b8c07dabef661f8b9df5f11aecff855cb73ba1b60ad516db1b863cd5ed1c"
    end
    on_intel do
      url "https://github.com/skaragianis/lsty/releases/download/v0.7.2/lsty-v0.7.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1326b28861c72551fa0c3c3b2ad1cd30b6fe8b875dd3d03f3e816beed15295f8"
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
