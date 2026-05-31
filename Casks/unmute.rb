cask "unmute" do
  version "1.3.4"
  sha256 "52fd212f7696d0232f71cb723780558bd19e08cc6b8b968992a574ebfc2808fa"

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
