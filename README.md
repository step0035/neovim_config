# Neovim Config

## Install neovim

Clone the neovim repo

Checkout the tag of the desired version, install according to the instruction

## Alias vi and vim to nvim

Add following lines to .bashrc

```
# Map vi and vim to nvim
alias vim="nvim"
alias vi="nvim" 
```

## Installing this neovim config

```
git clone git@github.com:step0035/neovim_config.git ~/.config/nvim
```

## Nerd Fonts

Go to https://github.com/ryanoasis/nerd-fonts to get fonts

Download the fonts and put it into `.local/share/fonts`

Set the terminal to use the font

## Telescope dependencies

install ripgrep for Telescope live_grep

```
sudo apt install ripgrep
```

## lspconfig dependencies

install node and npm


```
sudo apt install nodejs
sudo apt install npm
```
