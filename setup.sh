#!/bin/bash

#GIT folder
gitfolder="dot_files"
# Config FILES and DOT files
git_folder="$HOME/$gitfolder/Home"
git_dot_folder="$HOME/$gitfolder/Home/.config"
home_dot_config="$HOME/.config"

echo ""
echo "Configurated folders"
echo "-->>from Git:"
echo "	git_folder:  $git_folder "
echo "  	git_dot_folder:  $git_dot_folder"
echo "-->>To local:"
echo "	home:  $HOME"
echo "	home/.config/ : $home_dot_config"

read a
# Download Dots
# echo "Downloading Dotfiles"
# cd && git clone $giturl


echo "Delete corrent Symbolic at: :"
echo "-->> $HOME"
read a
rm -i $HOME/.xinitrc
rm -i $HOME/.bashrc
rm -i $HOME/.bash_profile
rm -i $HOME/.zshenv
rm -i $HOME/.zshrc
rm -i $home_dot_config/Code\ -\ OSS//User/settings.json


echo ""
echo "Delete corrent Symbolic at: :"
echo "-->> $home_dot_config"
read a
#rm -i $home_dot_config/alacritty
#rm -i $home_dot_config/zsh
#rm -i $home_dot_config/dwm
#rm -i $home_dot_config/lf
#rm -i $home_dot_config/htop
#rm -i $home_dot_config/Thunar
#rm -i $home_dot_config/xfce4


# /home/user/ = $git_folder
echo "Creating links :"
echo ""
echo "creating: ln -s $git_folder/file_or_folder $HOME"
read a
ln -s $git_folder/.xinitrc 		$HOME
ln -s $git_folder/.bashrc 		$HOME
ln -s $git_folder/.bash_profile $HOME
ln -s $git_folder/.zshenv 		$HOME
ln -s $git_folder/.zshrc 		$HOME
echo ""
echo "creating: ln -s $git_dot_folder/file_forder $home_dot_config"
read a
ln -s $git_dot_folder/alacritty $home_dot_config
ln -s $git_dot_folder/zsh $home_dot_config
ln -s $git_dot_folder/dwm $home_dot_config
ln -s $git_dot_folder/dwm_slstatus $home_dot_config
ln -s $git_dot_folder/dwm_dmenu $home_dot_config
ln -s $git_dot_folder/lf $home_dot_config
ln -s $git_dot_folder/htop $home_dot_config
# make thunar open diferent terminal than xfce-terminal
ln -s $git_dot_folder/Thunar $home_dot_config
ln -s $git_dot_folder/xfce4 $home_dot_config
ln -s $git_dot_folder/Code\ -\ OSS//User/settings.json $home_dot_config/Code\ -\ OSS//User/settings.json
#ln -s $git_dot_folder/Code\ -\ OSS//User/keybindings.json  $home_dot_config/Code\ -\ OSS//User/keybindings.json 
#ln -s $git_dot_folder/Code\ -\ OSS//User/snippets/ $home_dot_config/Code\ -\ OSS//User/snippets/ 
ln -s $git_dot_folder/mpv $home_dot_config




