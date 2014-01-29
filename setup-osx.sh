
rm ~/.profile
ln -s `pwd`/.profile ~/.profile

# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Run this from
brew bundle
