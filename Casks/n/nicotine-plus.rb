cask "nicotine-plus" do
  version "3.3.8"
  sha256 "5f7543a9d0f0222f3c29f3fad1b4fba347a5658a4dd3790affc7f1674383016e"

  url "https://github.com/nicotine-plus/nicotine-plus/releases/download/#{version}/macos-arm64-installer.zip",
      verified: "github.com/nicotine-plus/nicotine-plus/"
  name "nicotine-plus"
  desc "Graphical client for the Soulseek peer-to-peer network"
  homepage "https://nicotine-plus.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Nicotine+.app"

  zap trash: [
    "~/.config/nicotine",
    "~/Library/Preferences/org.nicotine_plus.Nicotine.plist",
    "~/Library/Saved Application State/org.nicotine_plus.Nicotine.savedState",
  ]
end
