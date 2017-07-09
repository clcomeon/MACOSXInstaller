#!/bin/bash
# MacOS Sierra HD-X
# Copyright (c) 2017, chris1111 <leblond1111@gmail.com>

# Vars
apptitle="MacOS Sierra HD-X"
version="2.2"
#get usbdiskpath Installer path
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/Installer.app/Contents/Resources/Installer.icns"

echo "**********************************************  "
echo "Starting MacOS Sierra HD-X!  "   
echo "**********************************************  "
if [[ $(mount | awk '$3 == "/Volumes/MacOS-HD" {print $3}') != "" ]]; then
 /usr/sbin/diskutil rename "MacOS-HD" "MacOSHD"
fi

Sleep 2
osascript ./main.app

Sleep 2

echo "**********************************************  "
echo "Mount Installer image!  "
echo "**********************************************  "
Sleep 2
osascript -e 'display notification "MacOS Sierra HD" with title "OS Install Start"  sound name "default"'
		
       
Sleep 2
osascript ./Select.app
Sleep 2
# Select Deploy
response=$(osascript -e 'tell app "System Events" to display dialog "Select Deploy 
to Deploy on your SSD or Disk.\n\nSelect Cancel for Quit" buttons {"Cancel","Deploy"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')

action=$(echo $response | cut -d ':' -f2)



  # Get input folder of usbdisk disk 
  usbdiskpath=`/usr/bin/osascript << EOT
    tell application "Finder"
        activate
        set folderpath to choose folder default location "/Volumes" with prompt "Select your SSD /or Disk and clic choose"
    end tell 
    return (posix path of folderpath) 
  EOT`

  # Cancel is user selects Cancel
  if [ ! "$usbdiskpath" ] ; then
    osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
    exit 0
  fi


# Parse usbdisk disk volume
usbdisk=$( echo $usbdiskpath | awk -F '\/Volumes\/' '{print $2}' | cut -d '/' -f1 )
disknum=$( diskutil list | grep "$usbdisk" | awk -F 'disk' '{print $2}' | cut -d 's' -f1 )
devdisk="/dev/disk$disknum"
# disknum
devdiskr="/dev/rdisk$disknum"
# Get Drive size
drivesize=$( diskutil list | grep "disk$disknum" | grep "0\:" | cut -d "*" -f2 | awk '{print $1 " " $2}' )

# Set output option
if [ "$action" == "Deploy" ] ; then
  source=$inputfile
  dest="$drivesize $usbdisk (disk$disknum)"
  outputfile=$devdiskr
  check=$source
fi

# Confirmation Dialog
response=$(osascript -e 'tell app "System Events" to display dialog "Please confirme your choice and clic OK\n\nDestination: \n'"$dest"' \n\n\nNOTE: MacOS will be Déploy to the Disk!." buttons {"Cancel", "OK"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'" ')
answer=$(echo $response | grep "OK")  

# Cancel is user does not select OK
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
  exit 0
fi

/usr/sbin/diskutil rename "$usbdiskpath" "MacOS-HD"
echo " "
# create a named pipe
rm -f /tmp/hpipe
mkfifo /tmp/hpipe

# create a background job which takes its input from the named pipe
./CocoaDialog.app/Contents/MacOS/CocoaDialog progressbar \
--indeterminate --title "MacOS Sierra HD-X" \
--text "Please wait...  Installation ➤ /Volumes /MacOS-HD" < /tmp/hpipe &


# associate file descriptor 3 with that pipe and send a character through the pipe
exec 3<> /tmp/hpipe
echo -n . >&3

# run the pkg
osascript -e 'do shell script "installer -allowUntrusted -verboseR -pkg /tmp/Installer-OS/Packages/OSInstall.mpkg -target /Volumes/MacOS-HD" with administrator privileges'

# Exit if Canceled
if [ ! "$action" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
  exit 0
fi

echo "  "
echo "**********************************************  "
echo "Unmount Installer image!  "
echo "**********************************************  "
Sleep 2
hdiutil detach /tmp/Installer-OS

Sleep 2
echo "**********************************************  "
echo "Volume rename MacOSSierra-HD  "
echo "**********************************************  "
/usr/sbin/diskutil rename "MacOS-HD" "MacOSSierra-HD"

sleep 5

# now turn off the progress bar by closing file descriptor 3
exec 3>&-

# wait for all background jobs to exit
wait
rm -f /tmp/hpipe



echo "Completed succès. 

Enjoy!  " 