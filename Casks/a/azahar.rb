cask "azahar" do
  version "2124.1"
  sha256 "7215cb4d4b22a44dc7899fdc41d6fe486f34de855ebf5f64914a54c7d62b9791"

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
                   args: ["-d", ".com.apple.quarantine", "/Applications/Azahar.app"]
  end

  zap trash: [
    "~/Library/Application Support/Azahar",
    "~/Library/Preferences/org.azahar-emu.azahar.plist",
  ]
end
