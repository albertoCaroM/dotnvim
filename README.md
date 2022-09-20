# INSTRUCTIONS

choose auto or manual configuration no both.

## Auto-configuration

sh -c "$(curl -fsSL https://raw.githubusercontent.com/albertoCaroM/dotnvim/master/configure.sh)"


## Manual-configuration

```
  install -d ~/.config 
  git clone https://github.com/albertoCaroM/dotnvim ~/.config/nvim
  rm ~/.local/share/nvim ~/.config/nvim/plugin/packer_compiled.lua -rf
  nvim --headless -c "lua download_packer({force=true})"
  nvim -c "PackerInstall"
```
