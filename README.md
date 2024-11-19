# Homebrew Tap

This Tap is currently just for Elgato Wave Link 2 Beta.

## How do I install this Cask?

`brew install --cask oliverdowling/tap/elgato-wave-link@beta`

Or `brew tap oliverdowling/tap` and then `brew install --cask elgato-wave-link@beta`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "oliverdowling/tap"
cask "elgato-wave-link@beta"
```

## How did I create this Tap?

```zsh
brew tap-new oliverdowling/homebrew-tap
brew create --cask "https://edge.elgato.com/egc/macos/wavelink/2.0.2/WaveLink_2.0.2.3431.pkg" --tap=oliverdowling/tap --set-name elgato-wave-link@beta
```

I then modified the resulting file to be similar to the [`elgato-wave-link` Cask code](https://github.com/Homebrew/homebrew-cask/blob/dc4c192b59003a7ea44c646d6a500298d9bcc244/Casks/e/elgato-wave-link.rb).
