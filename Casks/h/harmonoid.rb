cask "harmonoid" do
  version "0.3.9"
  sha256 "f516836e51c185959beb431f4cb4d85a50e6e965342d23a4ed3f54fb73c89058"

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
