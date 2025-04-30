cask "ryujinx@canary" do
  version "1.3.37"
  sha256 "30587bdf23a8b32852856ecbd1a8009b9aae6c1105d98303697fc9e21c676087"

  url "https://github.com/Ryubing/Canary-Releases/releases/download/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Ryubing/Canary-Releases/"
  name "Ryujinx"
  desc "EA of a Nintendo Switch emulator written in C#, originally created by gdkchan"
  homepage "https://ryujinx.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Ryujinx.app", target: "RyujinxCanary.app"

  zap trash: [
    "/Library/Application Support/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
