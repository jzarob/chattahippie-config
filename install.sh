#!/bin/sh

read -p "GitHub Username: " GITHUB_USERNAME

if ! [ -x "$(command -v brew)" ]; then
    echo "Installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Installing brew cask..."
    brew tap caskroom/cask
fi

cat packages/brew-packages.txt | xargs brew install
cat packages/brew-cask-packages.txt | xargs brew install

#npm globals
npm i -g @angular/cli
npm i -g sass

#zsh config
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/${GITHUB_USERNAME}/${GITHUB_USERNAME}-config/master/.zshrc > ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/${GITHUB_USERNAME}/${GITHUB_USERNAME}-config/master/agnoster-${GITHUB_USERNAME}.zsh-theme > ~/.oh-my-zsh/custom/themes/agnoster-${GITHUB_USERNAME}.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s /bin/zsh

echo "zsh configured. Input to continue..."
read

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
sh fonts/install.sh
rm -rf fonts 
