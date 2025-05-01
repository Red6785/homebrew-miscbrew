cask "harmonoid" do
  version "0.3.10"
  sha256 "eea7149d805ab14aa2b045b9e9fab82468288c199fab272b0c832908258bc657"

  url "https://github.com/alexmercerind2/harmonoid-releases/releases/download/v#{version}/harmonoid-macos-universal.dmg",
      verified: "github.com/alexmercerind2/harmonoid-releases/"
  name "harmonoid"
  desc "Music player"
  homepage "https://harmonoid.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :mojave"

  app "Harmonoid.app"

  zap trash: [
    "~/Library/Application Scripts/com.alexmercerind.harmonoid",
    "~/Library/Containers/com.alexmercerind.harmonoid",
  ]
end
