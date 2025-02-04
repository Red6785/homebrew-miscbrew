cask "ryujinx" do
  version "1.2.81"
  sha256 "ad444ebe3cd03ee1cda30723f7f8d16e4319f6c2374e9d2f9ad8f19adf04a724"

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
