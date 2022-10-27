![logo](/minideb_logo.png) UPDATE 27-out-2022

**Minideb** :octocat:

This script automates the post-installation of Debian, implementing a clean and minimalist system with Openbox;

![screen1](/screenshot/2020-05-07-170858_1920x1080_scrot.png)
          
![screen2](/screenshot/2020-05-07-170543_1920x1080_scrot.png)

![screen3](/screenshot/2020-05-07-172810_1920x1080_scrot.png)

![screen4](/screenshot/screenshot-1601466522.png)


Currently tested in **Debian 11.5 (bullseye)**, but with updates for future versions of the system.

To use the script you must install a clean version of Debian, preferably using a netinstall .iso; The only thing you should install, optionally, is the "standard system utilities" if you want a less raw system.

![screen4](/screenshot/DB.png)

> **How to use**

Before starting, add your user to the *sudo* group, remembering to replace the word *YOUR_USER* with the name of the system user.

```
# su -
# apt install sudo
# adduser YOUR_USER sudo
# halt --r now
```
> **After you add your user, restart the system and run:**
```
$ cd ~
$ sudo apt install git
$ git clone https://github.com/fm4lloc/minideb
$ cd minideb
$ chmod +x ./install.sh
$ ./install.sh -i
```

> **Key shortcuts:**

Shortcuts can be modified in the file: [/openbox/rc.xml](/openbox/rc.xml)

| Keyboard Shortcut	        | Description                     |
| ------------------------- |:-------------------------------:|
| Alt+F                     | Open Thunar File Manager        |
| Alt+E                     | Open Sakura terminal            |
| Alt+F2                    | Open gmrun application launcher |
| PrintScreen               | screenshot with maim            |
