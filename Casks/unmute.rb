cask "unmute" do
  version "1.4.14"
  sha256 "599068feee4863097890290ce34c269e90c23225a719d66e668317a76c1f5459"

  url "https://github.com/arpitpatel25/unmute/releases/download/v#{version}/unmute-#{version}-arm64.dmg",
      verified: "github.com/arpitpatel25/unmute/"
  name "unmute"
  desc "Voice-first dictation and coding-agent control"
  homepage "https://arpitpatel25.github.io/unmute/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  # The app declares LSMinimumSystemVersion 12.0. This read :big_sur while the
  # cask tracked the older dictation-only build; leaving it would let a Big Sur
  # user install a binary that cannot launch.
  depends_on macos: :monterey
  depends_on arch: :arm64

  app "unmute.app"

  zap trash: [
    "~/.unmute",
    "~/Library/Application Support/unmute",
    "~/Library/Caches/com.arpitpatel.unmute",
    "~/Library/Preferences/com.arpitpatel.unmute.plist",
    "~/Library/Saved Application State/com.arpitpatel.unmute.savedState",
  ]
end
