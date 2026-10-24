class Vonbraun < Formula
  desc "vonBraun connector: remote review for Granada pages"
  homepage "https://github.com/daskinnyman/vonbraun-release"
  url "https://github.com/daskinnyman/vonbraun-release/releases/download/v0.2.0/vonbraun-0.2.0.tgz"
  version "0.2.0"
  sha256 "0fe5c70e76971bb4cba1c05de6d239dd5bbc17fb0998eeebc307c1a00479fc3d"

  depends_on "node"

  def install
    system "npm", "install", "--ignore-scripts", "--omit=dev", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/vonbraun --version")
  end
end
