cask "mpv" do
  version "0.41.0"

  on_sonoma do
    url "https://github.com/mpv-player/mpv/releases/download/v#{version}/mpv-v#{version}-macos-14-arm.zip",
        verified: "github.com/mpv-player/mpv/releases"
    sha256 "5c96f9b21355fc0a11d2e2161ad65f33031070e9fb3f6bd9865fb459b94587e6"
  end

  on_sequoia do
    on_arm do
      url "https://github.com/mpv-player/mpv/releases/download/v#{version}/mpv-v#{version}-macos-15-arm.zip",
          verified: "github.com/mpv-player/mpv/releases"
      sha256 "489cf6a54f57c54f86ad8d7cedaf5bb26848770d58dc059021214e2f689ee799"
    end
    on_intel do
      url "https://github.com/mpv-player/mpv/releases/download/v#{version}/mpv-v#{version}-macos-15-intel.zip",
          verified: "github.com/mpv-player/mpv/releases"
      sha256 "41003617ab4f7784394b5ddea7ce51b3e0838e8cfc8166ad1a378b2eda3b583c"
    end
  end

  on_tahoe :or_newer do
    url "https://github.com/mpv-player/mpv/releases/download/v#{version}/mpv-v#{version}-macos-26-arm.zip",
        verified: "github.com/mpv-player/mpv/releases"
    sha256 "09820c0d84f6687446b84eb9df81fcf6a26ebe869cee58ea1857d7948cfb7c71"
  end

  name "mpv-test"
  desc "Free, open source, and cross-platform media player"
  homepage "https://mpv.io/"

  livecheck do
    url "https://github.com/mpv-player/mpv/releases"
    strategy :github_latest
  end

  conflicts_with cask:  "stolendata-mpv"
  depends_on macos: :sonoma

  app "mpv.app"
  binary "mpv.app/Contents/MacOS/mpv"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Caches/io.mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
    "~/Library/Saved Application State/io.mpv.savedState",
  ]
end
