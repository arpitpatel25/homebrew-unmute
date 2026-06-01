cask "unmute" do
  version "1.3.6"
  sha256 "9ec82a041a000fb22daa1d5b7183895afe4c1bc31da179b4534b4d67c6093971"

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
