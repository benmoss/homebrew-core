require "language/node"

class CubejsCli < Formula
  desc "Cube.js command-line interface"
  homepage "https://cube.dev/"
  url "https://registry.npmjs.org/cubejs-cli/-/cubejs-cli-0.30.28.tgz"
  sha256 "757eb6eca35812a4ca9cc6e73b19cb2cd89fd10acd87989d94fa2ee0fea0bcfe"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "cbb9bc1a906440d165c6d30561b2e1ed69f2f2d601d485751852fef4a0539a37"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "cbb9bc1a906440d165c6d30561b2e1ed69f2f2d601d485751852fef4a0539a37"
    sha256 cellar: :any_skip_relocation, monterey:       "eb91d4fdfe920292ff852198863387e998023b8e12c9dc7adb7f1335f1f88463"
    sha256 cellar: :any_skip_relocation, big_sur:        "eb91d4fdfe920292ff852198863387e998023b8e12c9dc7adb7f1335f1f88463"
    sha256 cellar: :any_skip_relocation, catalina:       "eb91d4fdfe920292ff852198863387e998023b8e12c9dc7adb7f1335f1f88463"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "cbb9bc1a906440d165c6d30561b2e1ed69f2f2d601d485751852fef4a0539a37"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubejs --version")
    system "cubejs", "create", "hello-world", "-d", "postgres"
    assert_predicate testpath/"hello-world/schema/Orders.js", :exist?
  end
end
