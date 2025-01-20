cask "ryujinx" do
  version "1.2.80"
  sha256 "a1d908595b9a6abdf607cd2b5d1af8f6fc761964e1538df1825bb8f736732fcc"

  url "https://github.com/Ryubing/Ryujinx/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Nintendo Switch emulator written in C#, originally created by gdkchan"
  homepage "https://github.com/Ryubing/Ryujinx"

  app "Ryujinx.app"

  zap trash: [
    "/Library/Application Support/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
