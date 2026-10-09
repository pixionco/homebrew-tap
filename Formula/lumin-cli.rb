# Rendered by scripts/render-package-manifests.ps1 for each release and pushed to pixionco/homebrew-tap
# (release.yml). Install: brew install pixionco/tap/lumin-cli
# (formula lumin-cli like the package id Pixion.Lumin.Cli; the command it installs is still `lumin`)
class LuminCli < Formula
  desc "Run Lumin test runs from your repository and CI"
  homepage "https://github.com/pixionco/lumin"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/pixionco/lumin/releases/download/v#{version}/lumin-osx-arm64.tar.gz"
      sha256 "351f802420eb3e542dc3d2bd86c920bf00b926e49790aa6e7d1c7819435bd444"
    end
    on_intel do
      url "https://github.com/pixionco/lumin/releases/download/v#{version}/lumin-osx-x64.tar.gz"
      sha256 "fb3f2a60c015da865ad7c77a9da94d687c8c45ce3265764a60d56f6cb9c74ae4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pixionco/lumin/releases/download/v#{version}/lumin-linux-arm64.tar.gz"
      sha256 "8040317b5d4631e69fe85497998f7accc364ca1cf6d3749e3c384960161afe4d"
    end
    on_intel do
      url "https://github.com/pixionco/lumin/releases/download/v#{version}/lumin-linux-x64.tar.gz"
      sha256 "1a70183332d527425751ebd110acafa6c2f102c324d5676d8291db3ce5864816"
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
