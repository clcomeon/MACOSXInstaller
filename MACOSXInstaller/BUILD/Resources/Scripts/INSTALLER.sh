#!/bin/sh
Osascript ./BUILD/Resources/Scripts/Notifications/start.scpt
nameh=`users`
function echob() {
  echo "`tput bold`$1`tput sgr0`"
}

function head
{
clear
echo "                         `tput setaf 7``tput sgr0``tput bold``tput setaf 10`© Copyright 2017 chris1111`tput sgr0` `tput setaf 7``tput sgr0`"
echo "               =================================================== "
echo " 
 
 
                             `tput setaf 7``tput sgr0``tput bold``tput setaf 10` \033[5mMACOSXInstaller`tput sgr0` `tput setaf 7``tput sgr0` 
 "

echo " "
}


function menu
{
echo "                              Welcome "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`$nameh`tput sgr0` `tput setaf 7``tput sgr0`" "
echo " "
echo "               =================================================== "
echo "                   `tput setaf 26`Credit Team Clover: Slice and Other
                   Credit Developer kext: rehabman, vit9696, Mieze
                   Credit Jamf Nation
                   Credit all Testers"
                         
echo " "
echo "                             
                                  `tput setaf 7``tput sgr0``tput bold``tput setaf 10` \033[5m⥥`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
echo "               `tput setaf 26`=================================================== "
echo "                     ✅  1 = ➖ `tput setaf 26`macOS High Sierra - APFS"
echo "               =================================================== "

echo "                     ✅  2 = ➖ `tput setaf 26`macOS High Sierra - HFS+J"
echo "               =================================================== "

echo "                     ✅  3 = ➖ `tput setaf 26`Clover Installer"
echo "               =================================================== "
 
echo "                     ❎  X = ➖ `tput setaf 26`Quit (EXIT) " 
echo "               =================================================== "
echo " "

echo " 
 

                         `tput setaf 7``tput sgr0``tput bold``tput setaf 10`     \033[5mAre you ready?`tput sgr0` `tput setaf 7``tput sgr0` 
\033[0m"
echo "               =================================================== "

read -n 1 option
}
function INSTALLER_OSXAPFS
{
head
echo " "
echo "macOS High Sierra APFS"
BUILD/Resources/Scripts/INSTALLER_HD.sh
echo " "
echo " "
echo " "
}
function INSTALLER_OSX
{
head
echo " "
echo "macOS High Sierra HFS+J"
BUILD/Resources/Scripts/INSTALLERHFS_HD.sh
echo " "
echo " "
echo " "
}
function INSTALLER_CLOVER
{
head
echo " "
echo "INSTALLER_CLOVER"
BUILD/Resources/Scripts/INSTALLER_CLOVER.sh
echo " "
echo " "
echo " "
}
function Quit
{
clear
echo " " 
echo "
Quit MACOSXInstaller..."
osascript -e 'tell app "terminal" to display dialog "Thanks to using MACOSXInstaller" with icon file "System:Library:CoreServices:loginwindow.app:Contents:Resources:ShutDown.tiff" buttons {"Exit"} default button 1 with title "MACOSXInstaller"'
osascript ./BUILD/Resources/Scripts/Notifications/quit.scpt
echo " " 
echob "Thanks`tput setaf 7``tput sgr0``tput bold``tput setaf 10` $hours $nameh`tput sgr0` `tput setaf 7``tput sgr0`"
echo " " 
exit 0
}
while [ 1 ]
do
head
menu
case $option in

1|1)
echo
INSTALLER_OSXAPFS ;;
2|2)
echo
INSTALLER_OSX ;;
3|3)
echo
INSTALLER_CLOVER ;;
x|X)
echo
Quit ;;


*)
echo ""
esac
echo
echob "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`Type anny to return in the menue`tput sgr0` `tput setaf 7``tput sgr0`"
echo
read -n 1 line
clear
done

exit




	
