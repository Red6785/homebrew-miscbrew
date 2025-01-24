cask "nicotine-plus" do
  version "3.3.6"
  sha256 "61aa8056d1d493295bab7af3797fbabac7578279dc43ca771f69959ec81928fc"

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
