cask "vencordinstaller" do
  version "1.4.0"
  sha256 "b7b4d38643223df94f3af937ad05cd25c68d0b1aa5b6da52b71aee4593da8817"

  url "https://github.com/Vencord/Installer/releases/download/v#{version}/VencordInstaller.MacOS.zip",
      verified: "github.com/Vencord/Installer/"
  name "vencordinstaller"
  desc "Installer for Discord client-side mod"
  homepage "https://vencord.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "VencordInstaller.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", ".com.apple.quarantine", "/Applications/VencordInstaller.app"]
  end

  caveats do
    requires_rosetta
  end
end
