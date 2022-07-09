# Neovim Config

### Install a later neovim version

Go to https://github.com/neovim/neovim/releases

Download nvim.appimage 

```
chmod u+x nvim.appimage && ./nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```
### Alias vi and vim to nvim

Add following lines to .bashrc

```
# Map vi and vim to nvim
alias vim="nvim"
alias vi="nvim" 
```

### Installing this neovim config

```
git clone git@github.com:step0035/neovim_config.git ~/.config/nvim
```
