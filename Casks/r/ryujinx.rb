cask "ryujinx" do
  version "1.3.1"
  sha256 "387a50851fafcf4e9dc863221b7bee608cb42cb59613a53be67e8ebeb37060f1"

  url "https://github.com/Ryubing/Stable-Releases/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Ryubing/Stable-Releases/"
  name "Ryujinx"
  desc "Nintendo Switch emulator written in C#, originally created by gdkchan"
  homepage "https://ryujinx.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Ryujinx.app"

  zap trash: [
    "/Library/Application Support/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
