cask "cemu-metal" do
  # Every single version in this fork is a pre-release, so ignore that error.
  version "2.3.3"
  sha256 "2be8a9703de45b5d24e1cb676948ba113ed40c6adc4405ee129539299cbb0362"

  # This is a fork of the original project that adds in Metal as a graphics backend.
  url "https://github.com/SamoZ256/Cemu/releases/download/testing#{version}/Cemu_release.zip"
  name "cemu-metal"
  desc "Wii U emulator with Metal Graphics support"
  homepage "https://github.com/SamoZ256/Cemu/"

  livecheck do
    url :homepage
    strategy :github_prerelease
  end

  depends_on macos: ">= :monterey"

  app "Cemu_release.app", target: "Cemu.app"

  zap trash: [
    "~/Library/Application Support/Cemu",
    "~/Library/Caches/Cemu",
    "~/Library/Preferences/cemu-dev",
    "~/Library/Preferences/info.cemu.Cemu.plist",
    "~/Library/Saved Application State/com.yourcompany.CEmu.savedState",
    "~/Library/Saved Application State/info.cemu.Cemu.savedState",
  ]
end
