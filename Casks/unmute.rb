cask "unmute" do
  version "1.5.21"
  sha256 "03935e2d9625847d2ac28663304360944ee696ae302b1f45c53c06c4790b6d2f"

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
