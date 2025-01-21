cask "boringnotch" do
  version "jellyfin.snoring"
  sha256 "97780877acdbecc6701fc5970478c708f36417b3c28c2fda3db07732645fdce0"

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
