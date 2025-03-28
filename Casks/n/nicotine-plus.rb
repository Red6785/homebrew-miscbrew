cask "nicotine-plus" do
  version "3.3.10"
  sha256 "ae752794c8b8683ed47ce3c45e1cd55730179c04ca214dfe625a404f5af37b45"

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
