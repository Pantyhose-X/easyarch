#!/bin/bash

# Find the name of the folder the scripts are in

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

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
----------------------------------------------------------------------------------------
                            Automated Arch Linux Installer
----------------------------------------------------------------------------------------
                        Scripts are in directory named easyarch
"
    bash startup.sh
    source $SCRIPT_DIR/setup.conf
    bash 0-preinstall.sh
    arch-chroot /mnt /root/easyarch/1-setup.sh
    arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/easyarch/2-user.sh
    arch-chroot /mnt /root/easyarch/3-post-setup.sh

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
-------------------------------------------------------------------------
                    Automated Arch Linux Installer
-------------------------------------------------------------------------
                Done - Please Eject Install Media and Reboot
"
