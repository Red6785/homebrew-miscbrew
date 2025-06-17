cask "azahar" do
  version "2122"
  sha256 "5fd63db65e915e5cdfbc00e8f0c8420907d629652bc0e3cc7f096c6d64d1b3d0"

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

  zap trash: [
    "~/Library/Application Support/Azahar",
    "~/Library/Preferences/org.azahar-emu.azahar.plist",
  ]
end
