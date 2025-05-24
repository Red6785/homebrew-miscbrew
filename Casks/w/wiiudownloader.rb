cask "wiiudownloader" do
  version "2.64"
  sha256 "a50223babb57860e9e24f10341d5518c81b319d7b746cedd7ea782ce25ec97a5"

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
