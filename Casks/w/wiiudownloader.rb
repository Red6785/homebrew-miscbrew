cask "wiiudownloader" do
  version "2.66"
  sha256 "1bc075060ce20114740b612256f41aa78f3b510e85116fa024b1f238a6f95840"

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

  zap trash: [
    "~/Library/Application Support/WiiUDownloader",
    "~/Library/Preferences/com.Xpl0itU.WiiUDownloader.plist",
    "~/Library/Saved Application State/com.Xpl0itU.WiiUDownloader.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
