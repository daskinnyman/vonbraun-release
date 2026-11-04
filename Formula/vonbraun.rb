class Vonbraun < Formula
  desc "vonBraun connector: remote review for Granada pages"
  homepage "https://github.com/daskinnyman/vonbraun-release"
  url "https://github.com/daskinnyman/vonbraun-release/releases/download/v0.2.1/vonbraun-0.2.1.tgz"
  version "0.2.1"
  sha256 "b4876c979de43a223c887185ab4f2214352228b692c228c9e60a2c6daf18594f"

  depends_on "node"

  def install
    system "npm", "install", "--ignore-scripts", "--omit=dev", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/vonbraun --version")
  end
end
