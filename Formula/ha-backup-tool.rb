class HaBackupTool < Formula
  desc "Tool for work with Home Assistant Backup"
  homepage "https://github.com/librun/ha-backup-tool"
  url "https://github.com/librun/ha-backup-tool/archive/refs/tags/v1.5.2.tar.gz"
  sha256 "d46d902c44cebb8ef650bc36486a6c568637da39b9397dd1c73a5d06a7848338"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/librun/tools"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c86440b48a9d1888d2b119380f7392ebc6e6b491484122ffe2f062a66f8c26a7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "262f39383f7ac7db63e917f5b006705022ae78509e4209a7b8ead8a27343cd02"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b3bf0fa8e593506d309eea37ab351a853506a4d88f1007b2d19524ed7ffaf1ee"
    sha256 cellar: :any_skip_relocation, sequoia:       "992f5d37a56309eeddc442562062a7f372767a5d4a5837eb49704e10bfe55a25"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0ff7939cb7f1bae815fbb3a9d8a6e54e00d15dc127e16ace1c1aa3b4a6f72481"
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
