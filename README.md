# Homebrew Tap

This Tap is currently just for mpv, but there is also a disabled Elgato Wave Link 2 Beta cask.

The mpv cask is currently required in a private tap because it is not signed to meet Gatekeeper requirements.

## How do I install this Cask?

`brew install --cask oliverdowling/tap/mpv`

Or `brew tap oliverdowling/tap` and then `brew install --cask mpv`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "oliverdowling/tap"
cask "mpv"
```

## How do I uninstall this cask?

`brew uninstall --cask oliverdowling/tap/mpv`

Or `brew uninstall --cask mpv` and then `brew untap oliverdowling/tap`.

## How did I create this Tap?

*Note that these instructions were for my original Elgato Wave Link cask*

```zsh
brew tap-new oliverdowling/homebrew-tap
brew create --cask "https://edge.elgato.com/egc/macos/wavelink/2.0.2/WaveLink_2.0.2.3431.pkg" --tap=oliverdowling/tap --set-name elgato-wave-link@beta
```

I then modified the resulting file to be similar to the [`elgato-wave-link` Cask code](https://github.com/Homebrew/homebrew-cask/blob/dc4c192b59003a7ea44c646d6a500298d9bcc244/Casks/e/elgato-wave-link.rb).

## How do I update this Tap?

```zsh
brew livecheck elgato-wave-link@beta
curl -O https://edge.elgato.com/egc/macos/wavelink/2.0.3/WaveLink_2.0.3.3572.pkg
shasum -a 256 WaveLink_2.0.3.3572.pkg
```

Then update the values in `Casks/elgato-wave-link@beta.rb`.

# Homebrew is deprecating all unsigned casks

To allow an app from the command line that is unsigned:

```zsh
sudo xattr -rd com.apple.quarantine /Applications/<name>.app
```

To find apps with gatekeeper flags

```zsh
find /Applications ~/Applications -name "*.app" -prune -xattrname com.apple.quarantine 2>/dev/null
```
