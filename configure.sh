if [ -d ~/.config/nvim ];
then
 if [ -d ~/.config/nvim.bck ];
 then 
   echo "unable to perform a backup copy, there is a previous configuracion on the path ~/.config/nvim.bck."
   echo "if you want to continue with the installation you must move or erase the folder ~/.config/nvim.bck"
   return 0
 fi
  mv ~/.config/nvim ~/.config/nvim.bck;
  rm ~/.local/share/nvim ~/.config/nvim/plugin/packer_compiled.lua -rf
fi
install -d ~/.config 
git clone https://github.com/albertoCaroM/dotnvim ~/.config/nvim
nvim --headless -c "lua download_packer({force=true})"
nvim -c "PackerInstall"
