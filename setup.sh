#!/bin/bash

#GIT folder
gitfolder="dot_files"
# Config FILES and DOT files
git_folder="$HOME/$gitfolder/Home"
git_dot_folder="$HOME/$gitfolder/Home/.config"
home_dot_folder="$HOME/.config"

echo ""
echo "Configurated folders"
echo "-->>from Git:"
echo "	git_folder:  $git_folder "
echo "  	git_dot_folder:  $git_dot_folder"
echo "-->>To local:"
echo "	home:  $HOME"
echo "	home/.config/ : $home_dot_folder"

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
echo ""
echo "Delete corrent Symbolic at: :"
echo "-->> $home_dot_folder"
read a
#rm -i $home_dot_folder/alacritty
#rm -i $home_dot_folder/zsh
#rm -i $home_dot_folder/dwm
#rm -i $home_dot_folder/lf
#rm -i $home_dot_folder/htop
#rm -i $home_dot_folder/Thunar
#rm -i $home_dot_folder/xfce4


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
echo "creating: ln -s $git_dot_folder/file_forder $home_dot_folder"
read a
ln -s $git_dot_folder/alacritty $home_dot_folder
ln -s $git_dot_folder/zsh $home_dot_folder
ln -s $git_dot_folder/dwm $home_dot_folder
ln -s $git_dot_folder/dwm_slstatus $home_dot_folder
ln -s $git_dot_folder/dwm_dmenu $home_dot_folder
ln -s $git_dot_folder/lf $home_dot_folder
ln -s $git_dot_folder/htop $home_dot_folder
# make thunar open diferent terminal than xfce-terminal
ln -s $git_dot_folder/Thunar $home_dot_folder
ln -s $git_dot_folder/xfce4 $home_dot_folder

