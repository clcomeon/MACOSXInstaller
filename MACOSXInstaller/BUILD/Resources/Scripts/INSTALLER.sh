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
 
 
                       `tput setaf 7``tput sgr0``tput bold``tput setaf 10` \033[5mInstaller macOS High Sierra HD`tput sgr0` `tput setaf 7``tput sgr0` 
 "

echo " "
}


function menu
{
echo "                            Welcome "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`$nameh`tput sgr0` `tput setaf 7``tput sgr0`" "
echo " "
echo "               =================================================== "
echo "                     `tput setaf 26`Credit and Thanks Team Clover
                     Credit  Testers"
                         
echo " "
echo "                             
                                  `tput setaf 7``tput sgr0``tput bold``tput setaf 10` \033[5m⥥`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
echo "               `tput setaf 26`=================================================== "
echo "                     ✅  1 = ➖ `tput setaf 26`macOS High Sierra HD - APFS"
echo "               =================================================== "

echo "                     ✅  2 = ➖ `tput setaf 26`macOS High Sierra HD - HFS+J"
echo "               =================================================== "
 
echo "                     ❎  X = ➖ `tput setaf 26`Quit (Exit)" 
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
echo "macOS High Sierra HD -APFS"
BUILD/Resources/Scripts/INSTALLER_HD.sh
echo " "
echo " "
echo " "
}
function INSTALLER_OSX
{
head
echo " "
echo "macOS High Sierra HD HFS+J"
BUILD/Resources/Scripts/INSTALLERHFS_HD.sh
echo " "
echo " "
echo " "
}
function Quit
{
clear
echo " " 
echo "
Quitter macOS High Sierra HD..."
osascript -e 'tell app "terminal" to display dialog "Thanks to using macOS High Sierra HD" with icon file "System:Library:CoreServices:loginwindow.app:Contents:Resources:ShutDown.tiff" buttons {"
EXIT"} default button 1 with title "macOS High Sierra HD"'
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
x|X)
echo
Quit ;;


*)
echo ""
esac
echo
echob "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`Type any key to return menue`tput sgr0` `tput setaf 7``tput sgr0`"
echo
read -n 1 line
clear
done

exit




	
