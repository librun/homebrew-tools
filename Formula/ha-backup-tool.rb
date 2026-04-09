class HaBackupTool < Formula
  desc "Tool for work with Home Assistant Backup"
  homepage "https://github.com/librun/ha-backup-tool"
  url "https://github.com/librun/ha-backup-tool/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "582105aabce3d24189e53ab81bab2034e845b13fcd98d9635d4241981c9d726d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/librun/tools"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c740fe746570e1ffd4741ac8b13966959efc51334da514a2dc6f8ddfe902f260"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "33891c44fcc58eef02d4f7b1bced0b17a8b524f64d4ba01c1f0bdc1cf834d754"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "aab547c04857411bb8e2def9e37cea71d0b63dc22d59f3a4eacae9cd07c2a1f3"
    sha256 cellar: :any_skip_relocation, sequoia:       "c0155adfed5a91f0e8b4b18c2e43816d8a011b43456fdd78f98208dbcdb9aeb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8170190e4a7ee8f9e30697e366161cbc3f15bcd2fa91119ef794ef98c95cdc8d"
  end

  depends_on "go" => :build

  def install
    ldflags = %w[
      -s -w
    ]
    tags = %w[extended withdeploy]
    system "go", "build", *std_go_args(ldflags:, tags:)

    generate_completions_from_executable(bin/"ha-backup-tool", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    system bin/"ha-backup-tool", "--version"
  end
end
