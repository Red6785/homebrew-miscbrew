cask "azahar" do
  version "2121.1"
  sha256 "7e85fb3de19e2681712d90e207851e8eb8a5a3c963924b83919a6b195715fe3d"

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
