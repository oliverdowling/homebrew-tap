cask "elgato-wave-link@beta" do
  version "2.0.2.3431"
  sha256 "94e9fcd221788d988067dacb906aa10301cc5c469c5ca81cac5f1087164141c3"

  url "https://edge.elgato.com/egc/macos/wavelink/#{version.major_minor_patch}/WaveLink_#{version}.pkg",
      user_agent: :fake
  name "Elgato Wave Link Beta"
  desc "Software custom-built for content creation"
  homepage "https://www.elgato.com/ww/en/s/beta"

  livecheck do
    url "https://www.elgato.com/graphql?query=query%20contentJson(%24identifier%3A%5BString%5D%24contentType%3AString%24options%3AContentJsonOptionsInput)%7BcontentJson(identifiers%3A%24identifier%20contentType%3A%24contentType%20options%3A%24options)%7Bidentifier%20entries%7D%7D&operationName=contentJson&variables=%7B%22contentType%22%3A%22downloads%22%2C%22identifier%22%3A%5B%22downloads%22%5D%2C%22options%22%3A%7B%22level%22%3A1%7D%7D&locale=en-WW"
    regex %r{\\"wave-link-mac-beta\\":\{\\"downloadURL\\":\\"https://[^\\]*(2\.\d+\.\d+\.\d+)\.pkg\\"}i
  end

  conflicts_with cask: [
    "elgato-wave-link",
  ]
  depends_on macos: ">= :catalina"

  pkg "WaveLink_#{version}.pkg"

  uninstall launchctl: "com.elgato.WaveLink",
            quit:      "com.elgato.WaveLink",
            pkgutil:   "com.elgato.pkg.WaveLink",
            delete:    "/Applications/Elgato Wave Link.app"

  zap trash: [
    "~/Library/Logs/WaveLink",
    "~/Library/Preferences/com.elgato.WaveLink.plist",
  ]
end
