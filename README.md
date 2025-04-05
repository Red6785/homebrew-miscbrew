# Red6785 Miscbrew

A personal collection of un-notarized Homebrew Casks for applications I personally use.

## How do I install these casks?

`brew install red6785/miscbrew/<cask>`

Or `brew tap red6785/miscbrew` and then `brew install <cask>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "red6785/miscbrew"
brew "<cask>"
```
Note that the majority of these casks will be blocked by Apple Gatekeeper, as they are not signed. To prevent this, you can add the option `--no-quarantine` to the command. I am not responsible for any damage caused by using this command, and neither is the Homebrew team. Do this at your own risk.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
