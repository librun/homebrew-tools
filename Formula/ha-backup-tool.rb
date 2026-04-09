class HaBackupTool < Formula
  desc "Tool for work with Home Assistant Backup"
  homepage "https://github.com/librun/ha-backup-tool"
  url "https://github.com/librun/ha-backup-tool/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "582105aabce3d24189e53ab81bab2034e845b13fcd98d9635d4241981c9d726d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/librun/tools"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ba0c683e25692558e24d14e6e8820f6a401a7ad202785fd47ba7704c71996769"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "810de2b93d7be7979e7d9c262ce0824f9231cc3902b9b048a1bfa5172f85bd40"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0b7b6202f4c78ce493db2db8549ce732af7dd978c580d3ab8cd25efd507db151"
    sha256 cellar: :any_skip_relocation, sequoia:       "23b981e601a4c1602316748e432dd24e97f1dddb8086543bfd6567d6b442ed5f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "60f5636542615f15ab9eebc9853bbf08312fc9393dffcd98b8e6cfa2801ab718"
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
