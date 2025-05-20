cask "ryujinx@canary" do
  version "1.3.45"
  sha256 "17944d11c29c3dbd93c763a3936e8a3222c636c9384c58f2bab5ad9ee721f06c"

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
