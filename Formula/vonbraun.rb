class Vonbraun < Formula
  desc "vonBraun connector: remote review for Granada pages"
  homepage "https://github.com/daskinnyman/vonbraun-release"
  url "https://github.com/daskinnyman/vonbraun-release/releases/download/v0.1.0/vonbraun-0.1.0.tgz"
  version "0.1.0"
  sha256 "3760f20fe1eee8f2380e1e67feb6b5f58fa1c30ca7339a06e4db7e793c04e4a7"

  depends_on "node"

  def install
    system "npm", "install", "--ignore-scripts", "--omit=dev", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/vonbraun --version")
  end
end
