# Rendered by scripts/render-package-manifests.ps1 for each release and pushed to pixionco/homebrew-tap
# (release.yml). Install: brew install pixionco/tap/lumin-cli
# (formula lumin-cli like the package id Pixion.Lumin.Cli; the command it installs is still `lumin`)
class LuminCli < Formula
  desc "Run Lumin test runs from your repository and CI"
  homepage "https://github.com/pixionco/lumin"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/pixionco/lumin/releases/download/v0.1.1/lumin-osx-arm64.tar.gz"
      sha256 "79898990b415413519bed6e3978d94273c5fde99bae1b9db7c3f19b6ca7e3898"
    end
    on_intel do
      url "https://github.com/pixionco/lumin/releases/download/v0.1.1/lumin-osx-x64.tar.gz"
      sha256 "86eddc6a80ff51a885975e898877b5892597b3eb1fda0a5101f3b6156c2ed362"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pixionco/lumin/releases/download/v0.1.1/lumin-linux-arm64.tar.gz"
      sha256 "90e97fda6147b624e593814168ca984af2208921c346afb8db3289fdad6dcc0f"
    end
    on_intel do
      url "https://github.com/pixionco/lumin/releases/download/v0.1.1/lumin-linux-x64.tar.gz"
      sha256 "c936061974960d8961043c79b98679494289b3d6bc45cf6cceb7210588a82afd"
    end
  end

  def install
    bin.install "lumin"
    generate_completions_from_executable(bin/"lumin", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/lumin --version").strip
  end
end
