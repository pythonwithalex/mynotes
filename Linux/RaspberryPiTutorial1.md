## Headless Raspberry Pi install Using a Mac

##### Preamble

In this tutorial, I’m going to show you how to install and configure a raspberry pi. The goal is to get your pi ready to be put to use -  it will have a functional partition scheme, good default network settings and ssh accessible and password-protected on your local network. In follow-up posts, I’ll demonstrate a few practical uses I’ve found for it, such as a samba share, a web server, a webcam, as well as some backup solutions.  

This tutorial will show any GUI options when appropriate, but the command-line is the main focus here.   If that is an issue for you, you might consider x, y and z.

##### What you need

+ An SD card reader (if you have a MacBook, iMac or Mac Mini, it may be built into your computer)

+ An SD card or a microSD card and a microUSB adapter that is 4GB or larger in size.  If you are going to purchase one, do some research on quality, not all SD cards yield good results

+ A Mac on which you have administrative privileges, preferably one with data that other people don't depend on or hold dear

+ A Wifi Router and Internet Access

+ An extra Ethernet cable

+ A raspberry Pi B model with a 5V microUSB power supply.

#### Formatting the SD Card

+ Before you insert the SD card, open the Terminal (**tip**: Cmd + spacebar + type ‘Termi…’ + hit Enter)

+ Type **````diskutil list````** and note the device output. If no other disks are attached at this time, you will likely see just the ````/dev/disk0```` device and its partitions, ````/dev/disk0s1````, ````/dev/disk0s2````, etc.  These are the BSD device labels.

+ After we insert the SD card, **````diskutil list````** should reveal an additional mounted device, most likely at ````/dev/disk1````. You want to make sure you reformat this disk, which is why we taking a safer route and comparing the output list before and after we insert the card. If you reverse the source and destination of the copy utility we will use, you will erase the data on your hard drive.

+ Insert the SD card into a card reader or into your mac

+ Type ````diskutil list```` again

+ Note the newly added disk’s device name.  For me, it was ````/dev/disk1````.

+ Understand the difference between ````/dev/disk1```` and ````/dev/disk1s0```` or ````/dev/disk1s1````, etc.  The first describes the physical device, the latter examples refer to the logical partitions on that device. We will be writing a group of filesystems that comprise the Raspbian OS to the new ````/dev/disk1```` device.

+ Open Disk Utility

+ You should see your disk in the left pane. Mine says 7.86GB Apple SDXC Reader.

+ Find the erase Tab and change the format to MS-DOS(FAT)

+ name your disk, e.g. RASPI

+ Hit Erase

+ Unmount the disk but don’t eject it.  You can do this with the terminal command ```` sudo diskutil unmount /dev/disk1````.

#### Command line

+ Before you insert the SD card, open the Terminal (**fast way**: command + spacebar + type ‘Termi…’ + hit enter)

+ Type diskutil list and note the output. After we insert the SD card, it should output an additional disk. You want to make sure you reformat the correct disk, which is why we taking a safer route and comparing the output list before and after we insert the card.

+ Connect the card reader with the SD card inserted to the the computer's USB drive

+ Type ````diskutil```` list again

+ Find the newly added disk’s device name.  For me, it was ````/dev/disk1````

+ Double check you have the right disk!

+ We'll now type a command that reformats the correct disk as a FAT32 filesystem with the name RASPI.
 The format for the command is this: ````sudo diskutil eraseDisk [FORMAT] [FILESYSTEM LABEL] [DEVICE]````

So, in my case I type:

```sudo diskutil eraseDisk FAT32 RASPI /dev/disk1````

**Note**: I had some trouble with this at first because I was typing the filesystem label in lowercase. I got the following error: “raspi does not appear to be a valid volume for its file system.” A less than informative message, if you ask me.  Make sure to type the label in CAPS.

**Note**: I also issues with my card that stemmed from the read-only switch being engaged on the SD adapter.  It also would occasionally mount read-only even with the write-mode switch engaged. I found that moving the switch back and forth helped, but there are other 'magical' fixes documented on the internet if that doesn't work for you.

+ Assuming the disk erasure and reformatting is successful, unmount but don’t eject the disk from disk utility.

#### Getting and Preparing the Raspberry Pi Operating System Image

+ Download the latest Raspbian image from the Raspberry Pi website in either ZIP format or as a torrent
 
  - Zip format (~ 1Gb in size): http://downloads.raspberrypi.org/raspbian_latest 
  - Torrent: http://downloads.raspberrypi.org/raspbian_latest.torrent

+ If you downloaded a ZIP file, unzip it. If you torrented it, you most likely got an IMG file.

+ I’m assuming the unzipped Raspbian .img file is located in your ````~/Downloads```` folder, aka ````/Users/<USERNAME>/Downloads````, but if it is in a different location, adjust the upcoming ````dd```` commands to reflect that.

+ Recall the device name of the SD card that you recently reformatted. In my case, it is ````/dev/disk1````.  You will write the Raspbian image to this device with the BSD utility, ````dd````. ````dd```` is a low-level block copying utility that comes in extremely handy in Unix/BSD-related tasks, but it is nick-named ‘disk destroyer’ for a reason.  Be careful to get the source (designated by ````if````, the input file) and destination (designated by ````of````, the output file) file paths correct.

+ We want to use dd in this way: ````dd  if=<RPI IMAGE FILE> of=<DESTINATION DEVICE> bs=<block size>````

+ This command will copy the image file to the newly formatted FAT32 disk: 

````sudo dd if=~/Downloads/2014-09-09-wheezy-raspbian.img of=/dev/disk1 bs=1m````

That command will copy the raspbian image to the FAT32-formatted SD device named ‘RASPI’.  It takes a while (took me just under 35 minutes) so be patient. 

#### Getting a Read on the Progress of ````dd````
````dd```` doesn’t give you any indication of its progress, but you can figure this out yourself by pressing ````CTRL + T```` in the terminal where the dd copy is presently working.  ````CTRL + T```` sends the ````dd```` process a ````SIGINFO```` signal that will return cpu load information to the console, as well as a read on how many bytes have been transferred by ````dd```` and the duration in seconds of the copy thus far.

The output is something like this:

````309329920 bytes transferred in 195.748521 secs ( 1580241 bytes/sec)````

With a little math, we can get the progress so far: 

bytes copied / disk image size = % done

309,329,920 / 3,100,000,000 or roughly 1 % done.

````du -sh ~/Downloads/2014-09-09-wheezy-raspbian.img````

````3.1G	/data/ISO/2014-09-09-wheezy-raspbian.img````

disk image size = 3.1 GB

progress = .31GB/3.1GB = .1 = 1%.

#### Network Setup

+ Now that your raspberry pi is properly imaged, connect it to an ethernet port on your wifi router.

+ Connect the micro-usb power source and plug it in. You should see a red light that indicates power.  Soon after you should see a few other lights (yellow and green), that indicate that the system is booting and that the network is active.

If this doesn’t happen for you, you can look at the light labels on the board and troubleshoot accordingly.  They are as follows:

**ACT** — SD Card Access

**PWR (RED)** - The device is powered

**FDX** - Full Duplex mode is enabled

**LNK** - The Ethernet LINK is present

**100** - a 100MBit connection is active 


If all has gone well, the raspberry pi should have booted up and received an ip address from your wifi router.
You can find the raspberry pi with the Terminal application in a few ways:

##### Method 1: Find it through your Wi-Fi Router
1. Log into the admin panel of your wifi router and look for connected devices.  It may reveal the hostname and ip of the pi.  It showed mine as hostname raspberrypi with ip address 192.168.1.10.  However, your wireless router software may not support this.

##### Method 2: Use nmap for MAC/BSD

2. Download and install nmap for mac, run ````sudo nmap -sP 192.168.0.0/24```` from your Mac Terminal.


##### Method 3: Brute Force

3. If you can’t or don’t want to download any extra tools and you’re on your own network, you can try a brute-force approach by pinging all of the possible IP addresses on your network once, and with a brief timeout setting. This is how you’d do it in bash:

````for i in {1..254}; do ping -c1 -t1 192.168.1.$i; done | grep -B 1 “ 0.0% packet loss”````

+ This will ping every ip address on your network once and wait a second before moving on, regardless of the result.  We are looking for a ping that results in %0.0 packet loss, and getting that line of text plus the previous line, where I know the IP address is usually output.

+ It should reveal the IP address of any system that respond to ping, but not the hostname.  But if you have only a handful of devices connected to your router, then the process of elimination shouldn't be too hard.

+ If you think you've found the pi's address, you can cancel the for loop by typing CTRL + \ into the terminal.  This sends a SIGQUIT signal to the bash process running the loop.

**Note**: this method is okay on your private network, but I don’t recommend doing it on a monitored network where such activity might be flagged as suspicious.
 
If you’ve found the IP address of the pi, then type ````ssh pi@raspberrypi````

You will likely see a message that says ‘The authenticity of the host ‘xxx.xxx.xxx.xxx’ can’t be established. Are you sure you want to continue connecting (yes/no)?’.  Type ‘yes’ and enter ‘raspberry’ as the password.

If you end up at a command prompt that says ‘pi@raspberrypi’, then congratulations! You have setup a raspberry pi. 

… but we are not done yet. :]


#### Resetting the Password

Type ````sudo raspi-config```` and select item #2, "Change User Password"
Enter your new password twice.
Try logging out and then back in.  Your new password should work with the user ````pi````, and you shouldn’t see the previous message regarding the questionable authenticity of this system's RSA key.

#### Updating current packages
run ````sudo apt-get update```` and wait a bit


#### Leaving the Pi with default Network Settings

+ Setting a static IP allows you to know the address of the PI at boot time, but it requires a little work.  If you don't want to set up a static IP on your WIFI network, you can leave the PI set to DHCP by default and then create a boot script that pings your router when the PI boots.  What this does is tell the router about its IP address, which gets passed to you when you run ````arp -a ```` on Linux/BSD/MAC system that is connected the router.  From there, you can deduce the proper IP.  For obvious reasons, a static IP is probably a better route.

You can create a boot script on the Pi by doing the following

````
sudo echo "ping -c 1 192.168.1.1" > /etc/init.d/pingrouter
service pingrouter
sudo vim /etc/init.d/pingrouter

````/etc/init.d/<SCRIPT NAME>````, e.g. ````/etc/init.d/pingrouter````

#### Assigning the system a static IP

+ The file where we define our networking settings is ````/etc/network/interfaces```` . Let’s copy that so that we can modify it while retaining the old copy.

````cp /etc/network/interfaces /etc/network/interfaces.orig````

+ Now lets modify the contents. The default file looks like this

````cat /etc/network/interfaces````

```bash
auto lo

iface lo inet loopback
iface eth0 inet dhcp

allow-hotplug wlan0
iface wlan0 inet manual
wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp
````

We need to change it to this (note the arrows)

````bash
allow-hotplug wlan0
iface wlan0 inet manual
wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
--> iface default inet **static**

--> address 192.168.1.10
--> gateway 192.168.1.1
--> netmask 255.255.255.0
--> network 192.168.1.0
--> broadcast 192.168.1.255

allow-hotplug wlan0
iface wlan0 inet manual
wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp
````

We need to do a few things:

+ Change the 4th line’s **dhcp** keyword to static.

+ Determine proper IP, gateway, netmask, network and broadcast settings

#### Determining your IP address, Gateway, Netmask, Network and Broadcast Settings

+ We need a static ip

#### Expanding the root partition

+ We wrote a 2.9GB root filesystem to the SD card, but that means whatever space is left on the card isn’t presently usable. For me, that’s about 5GB of space.  Fortunately, the Raspbian Image developers have provided us with a convenient ‘Expand Filesystem’ option in the same ````raspi-config```` panel we just used to set our password.


+ Type ````sudo raspi-config```` again
choose option #1
It should say, “Root partition has been resized … ”. Hit **OK**, choose **Finish** at the bottom, and say yes to the reboot option.  Since we’ve already set a static ip for the pi, rebooting won’t mean we have to go looking for the ip again.
