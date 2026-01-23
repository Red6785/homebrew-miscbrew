cask "wiiudownloader" do
  version "2.74"
  sha256 "e1b82e82eaeec97fb2117148e913b382bede38966ca043f6e8bdb3816d9682a2"

  url "https://github.com/Xpl0itU/WiiUDownloader/releases/download/v#{version}/WiiUDownloader-macOS-Universal.dmg"
  name "WiiUDownloader"
  desc "Application to download and decrypt Wii U games from Nintendo's official servers"
  homepage "https://github.com/Xpl0itU/WiiUDownloader"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "WiiUDownloader.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "/Applications/WiiUDownloader.app"]
  end

  zap trash: [
    "~/Library/Application Support/WiiUDownloader",
    "~/Library/Preferences/com.Xpl0itU.WiiUDownloader.plist",
    "~/Library/Saved Application State/com.Xpl0itU.WiiUDownloader.savedState",
  ]
end
