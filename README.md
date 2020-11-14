# Steam-Pin-To-Start

This Batch and Poweshell script pins Steam and Epic games to the windows 10 start menu.

Some Epic games might not work properly in the current release but every steam game I tried works perfectly.

The reason this script exists is because when you create a shortcut from Steam or Epic games launcher the shortcut is a url and not a shortcut to an exe therefore windows wont let you pin it to start menu.

The script encapsulates the url with explorer.exe which is pinnable and pins it to the start menu. It will then open up the start menu folder in explorer so that you can edit the game icon. I haven't been able to figure out how to extract the icon from the original shortcut so for now this step is manual.

To pin the shortcut to startmenu the script will download and use syspin.exe you can read about it [here](http://www.technosys.net/products/utils/pintotaskbar)

# Usage
1. Download `create_steam_shortcut.cmd` from this repo and save it wherever you want. I recommend making a shortcut to it on your desktop.
2. In Steam right click on your game and click manage then click create shortcut. This will create a shortcut on the desktop. Epic games is the same.
3. Drag the steam created shortcut onto the script. A cmd window will open up. And your game will now appear on the start menu
4. Explorer will open up in the start menu folder where you should see your game shortcut with no icon.
5. Right click on the game shortcut and click on properties then click on change icon. Select browse and go to your game installation folder and click on the exe. This will then grab the games.exe icon and set it to the shortcut. The icon in the start menu will also update.
