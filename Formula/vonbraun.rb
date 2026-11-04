class Vonbraun < Formula
  desc "vonBraun connector: remote review for Granada pages"
  homepage "https://github.com/daskinnyman/vonbraun-release"
  url "https://github.com/daskinnyman/vonbraun-release/releases/download/v0.2.2/vonbraun-0.2.2.tgz"
  version "0.2.2"
  sha256 "bc46b410d7a22bc8259ece76b83b3278a903df3cb0ed4a39b428ffed2811ea83"

  depends_on "node"

  def install
    system "npm", "install", "--ignore-scripts", "--omit=dev", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/vonbraun --version")
  end
end
