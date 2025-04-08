cask "vencordinstaller" do
  version "1.4.0"
  sha256 "b7b4d38643223df94f3af937ad05cd25c68d0b1aa5b6da52b71aee4593da8817"

  url "https://github.com/Vencord/Installer/releases/download/v#{version}/VencordInstaller.MacOS.zip",
      verified: "github.com/Vencord/Installer/"
  name "vencordinstaller"
  desc "Installer for Discord client-side mod"
  homepage "https://vencord.dev/"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :github_latest
  end

  app "VencordInstaller.app"

  caveats do
    requires_rosetta
  end
end
