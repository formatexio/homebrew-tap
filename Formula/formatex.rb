class Formatex < Formula
  desc "Compile LaTeX from the terminal — no local TeX Live required"
  homepage "https://formatex.io"
  url "https://github.com/formatexio/cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "5e7196697c7e381b6ce75ed51a26a4650293572e5f194b0c8e9cd666bd158e76"
  license "MIT"
  head "https://github.com/formatexio/cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/formatexio/cli/cmd.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "formatex version", shell_output("#{bin}/formatex version")
  end
end
