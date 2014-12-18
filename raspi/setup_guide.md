#### WORDPRESS POST-CONFIG
make sure ps aux | grep php shows that owner of those processes is www-data
sudo chown -R www-data:www-data /var/www (avoid ftp login when installing plugins)
install wpsupercache to speed up wordpress by using static pages

#### PASSWORD-LESS ENTRY
password-less ssh entry
assuming you have no .ssh dir, mkdir ~/.ssh; chmod 700 ~/.ssh on your mac
ssh-keygen -t rsa
hit enter until done.
cat ~/.ssh/id_rsa.pub | ssh user@pi 'cat >> ~/.ssh/authorized_keys'

#### RESTORABLE-BACKUP
note: this isn't a solution if you hose your raspi. It's more of a 'I just want to start fresh' solution.  Raspi needs to boot from an SD device, so your best bet if you want a reliable bootable backup is to get a backup sd device and image that one in addition to your primary one.

However, if you want to go back to a point in time without getting an SD device, this approach at least works.
You need to modify the /boot/cmdline.txt file so that the root=/dev/mm... entry is /dev/sdXN, where X is your usb device number on the raspberry pi and N is the root partition on your usb device.  For me, since I use another usb drive for my data (which is /dev/sda), the root= field had to be set to root=/dev/sdb2 to point to the root partition.

Before you restart your pi or edit any thing, insert the usb drive and run 'dmseg  | grep /dev/sd'.  The most recent entry will show you the device name of your usb.  Don't guess.

next, i did a block-level clone with dd over netcat as a bootable backup.

on host backing up:
nc -l 90000 > backup.img

on raspi:
if your system resides completely on /dev/mmcblk0:
dd if=/dev/mmcblk0 | nc 192.168.1.116 7000
there are potential issues with copying filesystem being mounted rw while you do a dd, but in my experience, it didn't cause any problems.

#### RESTORING
I wrote this backup image to a usb drive
on my mac:
reformatted a usb drive (/Volumes/DATA) to FAT with Disk Utility
then I used dd to write the backup image 'pi.img'  to the usb device (device, not partition)
dd bs=1m if=/Users/me/pi.img of=/dev/disk2
(tip, use ctrl-T to sent a SIGINT signal to dd which will tell you the current number of input and output blocks at that point, as it is otherwise silent about its progress.)

1) backup your /etc/network/interfaces and /etc/resolv.conf files

2)

root@pi:~# cat /etc/network/interfaces
auto lo

iface lo inet loopback
iface eth0 inet static

address 192.168.1.116
netmask 255.255.255.0
gateway 192.168.1.1
network 192.168.1.0

nameserver 208.67.222.222
nameserver 208.67.220.220

root@pi:~# cat /etc/resolv.conf

nameserver 208.67.222.222
nameserver 208.67.220.220

raspi-config - > advanced options - > memory split : give gpu 16 mb of mem
sudo apt-get install lighttpd mysql-server php5-common php5-cgi php5
sudo apt-get install php5-mysql
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd force-reload
   22  sudo usermod -a -G webdev alexr
   23  sudo usermod -a -G www-data alexr
   24  sudo chown www-data:www-data /var/www
   25  sudo chmod 775 /var/www

logout, log back in

check http://<your static ip address> from inside your firewall
you should see a 'placeholder page'

cacheing plugin: need it to run a proper web server off of a raspi

clone filesystem over the network, potentially unsafe bc it's mounted rw, but...
on my mac: nc -l 7000 > pi.iso
on my pi: dd if=/dev/mmcblk0 | netcat 192.168.1.3 7000

lsblk -f showed me the filesystem label on the pi.
