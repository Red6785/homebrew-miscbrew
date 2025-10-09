cask "azahar" do
  version "2123.3"
  sha256 "5a43ac81713544de0e463f430433f7b2bd20c6efda6c2705f8dbc43f7936afaa"

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
