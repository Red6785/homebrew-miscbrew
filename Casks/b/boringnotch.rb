cask "boringnotch" do
  version "v2.7.3"
  sha256 "23786382548d33c59b309db558e513a92e3f95b63d611544dcddf5d196e46698"

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
