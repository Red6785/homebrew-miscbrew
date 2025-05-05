cask "ryujinx@canary" do
  version "1.3.38"
  sha256 "166841a976a33f3e367beead895829cffab6de72f54c6892cede368180e6cdc3"

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
