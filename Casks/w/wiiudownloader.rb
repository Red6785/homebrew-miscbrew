cask "wiiudownloader" do
  version "2.60"
  sha256 "fc7ab9c554f100356f78bdcdcc4bb9e9525258a7af32bf7898b8c240fc0880cf"

  url "https://github.com/Xpl0itU/WiiUDownloader/releases/download/v#{version}/WiiUDownloader-macOS-Universal.dmg"
  name "WiiUDownloader"
  desc "Application to download and decrypt Wii U games from Nintendo's official servers"
  homepage "https://github.com/Xpl0itU/WiiUDownloader"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "WiiUDownloader.app"

  zap trash: [
    "~/Library/Application Support/WiiUDownloader",
    "~/Library/Preferences/com.Xpl0itU.WiiUDownloader.plist",
    "~/Library/Saved Application State/com.Xpl0itU.WiiUDownloader.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
