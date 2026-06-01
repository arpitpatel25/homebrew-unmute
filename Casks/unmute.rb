cask "unmute" do
  version "1.3.5"
  sha256 "d511e542da281f4c32ec336990be481cfca90dd5418673d399a1a4e23f7c5120"

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
