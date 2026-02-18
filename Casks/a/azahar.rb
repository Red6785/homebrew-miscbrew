cask "azahar" do
  version "2124.3"
  sha256 "39e689980c4de1967cdff1ab9fd03630ab0b59afc251905d1b5a44c4b6fcd4e5"

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-#{version}-macos-universal.zip",
      verified: "github.com/azahar-emu/azahar/"
  name "azahar"
  desc "Nintendo 3DS emulator"
  homepage "https://azahar-emu.org/"

  livecheck do
    url :url
    strategy :github_latest do |json|
      json["tag_name"][/^(\d+(?:\.\d+)?)/, 1]
    end
  end

  depends_on macos: ">= :ventura"

  app "azahar-#{version}-macos-universal/Azahar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "/Applications/Azahar.app"]
  end

  zap trash: [
    "~/Library/Application Support/Azahar",
    "~/Library/Preferences/org.azahar-emu.azahar.plist",
  ]
end
