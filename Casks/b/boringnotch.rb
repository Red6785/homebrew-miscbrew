cask "boringnotch" do
  version "v2.7.1"
  sha256 "6f62f32ee6d4e06b309f26e45c6ae468556f33e5f92f16bbab696fc8db44fc2e"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "/Applications/boringNotch.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/theboringteam.boringnotch",
    "~/Library/Caches/theboringteam.boringnotch",
    "~/Library/Containers/theboringteam.boringnotch",
  ]
end
