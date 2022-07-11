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

### Nerd Fonts

Go to https://github.com/ryanoasis/nerd-fonts to get fonts

Download the fonts and put it into `.local/share/fonts`

### Telescope dependencies

install ripgrep for Telescope live_grep

```
sudo apt install ripgrep
```
>>>>>>> 1626405 ([Telescope] Add telescope plugin)
