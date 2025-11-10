cask "wiiudownloader" do
  version "2.68"
  sha256 "e48aad51d90b28ab127384a69e73cd8019893478aadcc7a22bdc583664500acc"

  url "https://github.com/Xpl0itU/WiiUDownloader/releases/download/v#{version}/WiiUDownloader-macOS-Universal.dmg"
  name "WiiUDownloader"
  desc "Application to download and decrypt Wii U games from Nintendo's official servers"
  homepage "https://github.com/Xpl0itU/WiiUDownloader"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "WiiUDownloader.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", ".com.apple.quarantine", "/Applications/WiiUDownloader.app"]
  end

  zap trash: [
    "~/Library/Application Support/WiiUDownloader",
    "~/Library/Preferences/com.Xpl0itU.WiiUDownloader.plist",
    "~/Library/Saved Application State/com.Xpl0itU.WiiUDownloader.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
