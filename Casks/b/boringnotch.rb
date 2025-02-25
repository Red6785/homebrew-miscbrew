cask "boringnotch" do
  version "wolf.painting"
  sha256 "1a58ec27e5de30faf107fdf8b77575b1c39ace69e77b1330fc4ed6562bf2badc"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/#{version}/#{version.split(".").map(&:capitalize).join}.dmg",
      verified: "github.com/TheBoredTeam/boring.notch/"
  name "boringnotch"
  desc "Application that transforms your MacBook’s camera notch into a functional area"
  homepage "https://theboring.name/"

  livecheck do
    url "https://api.github.com/repos/TheBoredTeam/boring.notch/releases/latest"
    regex(/tag_name": "([^"]+)"/i)
    strategy :page_match
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "boringNotch.app"

  zap trash: [
    "~/Library/Application Scripts/theboringteam.boringnotch",
    "~/Library/Caches/theboringteam.boringnotch",
    "~/Library/Containers/theboringteam.boringnotch",
  ]
end
