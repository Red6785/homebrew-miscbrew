cask "primehack" do
  version "1.0.8"
  sha256 "f46999015644beae010f3b22bd061c4c37742e7c9f76c05089f2c08ab52d035b"

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

  app "PrimeHack-#{version}.app", target: "PrimeHack.app"

  zap trash: [
    "~/Library/Application Support/Dolphin",
    "~/Library/Preferences/org.dolphin-emu.dolphin.plist",
  ]
end
