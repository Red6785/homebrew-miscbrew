cask "primehack" do
  version "1.0.7a"
  sha256 "9166f5ffdd85a39628fecd47531b52c4ca48f682e9beb96ef2fccf8189b53973"

  url "https://github.com/shiiion/dolphin/releases/download/#{version}/MacOS-PrimeHack.Release.v#{version}.zip"
  name "primehack"
  desc "Dolphin fork intended to give Metroid Prime Trilogy mouselook controls"
  homepage "https://github.com/shiiion/dolphin"

  livecheck do
    url :homepage
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)*[a-z]?)$/i)
  end

  depends_on macos: ">= :catalina"

  app "PrimeHack-sha[26beef4].app", target: "PrimeHack.app"

  zap trash: [
    "~/Library/Application Support/Dolphin",
    "~/Library/Preferences/org.dolphin-emu.dolphin.plist",
  ]
end
