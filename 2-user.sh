#!/usr/bin/env bash
echo "-------------------------------------------------------------------------"
cat << "EOF"
  _____                       _                _
 | ____| __ _  ___  _   _    / \    _ __  ___ | |__
 |  _|  / _` |/ __|| | | |  / _ \  | '__|/ __|| '_ \
 | |___| (_| |\__ \| |_| | / ___ \ | |  | (__ | | | |
 |_____|\__,_||___/ \__, |/_/   \_\|_|   \___||_| |_|
                    |___/
EOF
echo -ne "
------------------------------------------------------------------------------
                    Automated Arch Linux Installer
                        SCRIPTHOME: easyarch
------------------------------------------------------------------------------

Installing AUR Softwares
"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.
source $HOME/easyarch/setup.conf

cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ~/yay
makepkg -si --noconfirm
cd ~
touch "~/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
ln -s "~/zsh/.zshrc" ~/.zshrc

yay -S --noconfirm --needed - < ~/easyarch/pkg-files/aur-pkgs.txt

export PATH=$PATH:~/.local/bin
cp -r ~/easyarch/dotfiles/* ~/.config/
pip install konsave
konsave -i ~/easyarch/kde.knsv
sleep 1
konsave -a kde

echo -ne "
-------------------------------------------------------------------------
                    SYSTEM READY FOR 3-post-setup.sh
-------------------------------------------------------------------------
"
exit
