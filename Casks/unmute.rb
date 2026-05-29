cask "unmute" do
  version "1.2.0"
  sha256 "11283839ef4aba2606b7499628cfc3aa4fa0045f5a0ef9603f858328a854028a"

  url "https://github.com/arpitpatel25/unmute-dictation/releases/download/v#{version}/unmute-#{version}-arm64.dmg",
      verified: "github.com/arpitpatel25/unmute-dictation/"
  name "unmute"
  desc "Voice-first dictation for macOS"
  homepage "https://github.com/arpitpatel25/unmute-dictation"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "unmute.app"

  zap trash: [
    "~/Library/Application Support/unmute",
    "~/Library/Preferences/com.arpitpatel.unmute.plist",
    "~/Library/Saved Application State/com.arpitpatel.unmute.savedState",
  ]
end
