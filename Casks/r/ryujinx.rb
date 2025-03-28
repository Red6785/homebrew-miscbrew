cask "ryujinx" do
  version "1.2.82"
  sha256 "20eb23fa8fcd03ea789346d8eeff4b0ccd5e60b019c68ae7069ee318b2517851"

  url "https://github.com/Ryubing/Ryujinx/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Nintendo Switch emulator written in C#, originally created by gdkchan"
  homepage "https://github.com/Ryubing/Ryujinx"

  livecheck do
    url :homepage
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
