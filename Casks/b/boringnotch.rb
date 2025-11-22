cask "boringnotch" do
  version "v2.7"
  sha256 "92dea45976135de91364bb6596c0fb0ac70b383c9793dc3152da5ef514349198"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/#{version}/boringNotch.dmg",
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
