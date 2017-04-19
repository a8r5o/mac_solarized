# my solarized cli env
Inacurate named nvim, vim, tmux and (ohmy)zsh enviroment.  

## You need the following:
nvim, tmux and zsh. if you do not have it already `brew` can install them for you.

As my git skills is not good enough to nest other projects you need to install it this way:
* `git clone https://github.com/arosl/mac_solarized.git ~/.config`
* `git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim`
* open nvim or vim (vim is just an alias for nvim in my .zshrc) it will give you a lot of errors. Ignore them for now.
* run `:PluginInstall` (it will take some time espesially YCM will take time, but worth it.)
* 
* You need a powerline font for the zsh theme i use.  
  * `git clone https://github.com/powerline/fonts.git`
  * `cd fonts`
  * `./install.sh`
* iterm2 (`brew cask install iterm2`) with the dark solarized color scheme. 
* Use the font 13pt Meslo LG S for Powerline.
* `ln -s ~/.config/zsh/.zshrc ~/.zshrc`

