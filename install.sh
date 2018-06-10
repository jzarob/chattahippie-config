#!/bin/sh

# Script to download and install my toolset

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew cask..."
brew tap caskroom/cask

#Programming Languages
brew install node
brew install elm
brew install pyenv

#Dev Tools
brew install git
brew install wget
brew install zsh
brew install zsh-completions
brew install openssl
brew install mysql
brew install cowsay
brew install fortune

#Dev Apps
brew cask install hyper
brew cask install visual-studio-code
brew cask install macdown

#Web Tools
brew cask install google-chrome
brew cask install firefox

#Brew tools are installed. configure them
echo "Brew install done. Input to continue..."
read

#npm globals
npm i -g ionic
npm i -g create-react-app
npm i -g eclint
npm i -g foreman
npm i -g sass

echo "npm globals are installed. Input to continue..."
read

#zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -fsSl https://raw.githubusercontent.com/chattahippie/chattahippie-config/master/agnoster-athomas.zsh-theme -o ~/.oh-my-zsh/custom/themes/agnoster-athomas.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "zsh configured. Input to continue..."
read

#VSCode config
curl -fsSL https://raw.githubusercontent.com/chattahippie/chattahippie-config/master/vscode-settings.json -o ~/Library/Application\ Support/Code/User/settings.json
/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code --install-extension EditorConfig.EditorConfig
/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code --install-extension HookyQR.beautify
/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code --install-extension PKief.material-icon-theme
# TODO install rest of useful extensions

#Hyper config
curl -fsSL https://raw.githubusercontent.com/chattahippie/chattahippie-config/master/.hyper.js -o ~/.hyper.js

# TODO Install Powerline fonts