
rm ~/.profile
ln -s `pwd`/.profile ~/.profile

# Install homebrew
ruby -e "$(curl -fsSL --insecure https://raw.github.com/Homebrew/homebrew/go/install)"

brew update

brew doctor

# Run this from
brew bundle
