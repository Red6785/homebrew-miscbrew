cask "kenjinx" do
  version "2.0.4"
  sha256 "4523d74788c227917d00ede6956b38920ec542df365899d527db09f3b984e851"

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

  postflight do
    system_command "/usr/bin/xattr", 
                   args: ["-d", "com.apple.quarantine", "/Applications/KenjiNX.app"],
                   sudo: false
  end

  zap trash: [
    "/Library/Application Support/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
