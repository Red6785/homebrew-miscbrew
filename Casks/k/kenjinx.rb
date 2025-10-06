cask "kenjinx" do
  version "2.0.5"
  sha256 "2b3b8d0ed47666c9b26c9afcec08a3ff20040066924b9979dd471b30e0030df4"

  url "https://github.com/Kenji-NX/Releases/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Kenji-NX/Releases/"
  name "kenjinx"
  desc "Nintendo Switch emulator"
  homepage "https://git.ryujinx.app/kenji-nx/ryujinx"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Ryujinx.app", target: "KenjiNX.app"

  zap trash: [
    "/Library/Application Support/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
