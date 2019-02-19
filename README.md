![logo](/minideb_logo.png)

**Minideb** :octocat:

This script automates the post-installation of Debian, implementing a clean and minimalist system with Openbox;

![screen1](/screenshot/2018-07-27-084940_1440x900_scrot.jpg)
          
![screen2](/screenshot/2018-07-27-084931_1440x900_scrot.jpg)

Currently tested in Debian 9.5, but with updates for future versions of the system.

To use the script you must install a clean version of Debian, preferably using a netinstall .iso; The only thing you should install, optionally, is the "standard system utilities" if you want a less raw system.

<img src="https://raw.githubusercontent.com/fm4lloc/stuff/master/2018-07-26-120025_1920x1080_scrot.jpg"/>

> **How to use**

Before starting, add your user to the *sudo* group, remembering to replace the word *YOUR_USER* with the name of the system user.

```
# su
# apt-get install sudo
# adduser YOUR_USER sudo
# halt --r now
```
> **After you add your user, restart the system and run:**
```
$ cd ~
$ sudo apt-get install git
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
| PrintScreen               | screenshot with Scrot           |
