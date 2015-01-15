## A Practical Guide to The Linux Command Line

#### Table of Contents
+ [Text Editors](#text-editors)
+ [The Linux Command Line](#the-linux-command-line)
+ [The Unix Philosophy and Toolchain](#unix-philosophy-and-tool-chain)
+ [The Linux Filesystem Structure](#linux-filesystem-structure)
+ [Redirection and Pipes](#redirection-and-pipes)
+ [Environment Variables](#environment-variables)
+ [Manipulating Text](#manipulating-text)
+ [Users, Groups, Permissions, SELinux](#users-groups-permissions-selinux)
+ [Best Practices](#best-practices)
+ [Links & Resources](#links-and-resources)


#### TEXT EDITORS

If you want to use the Linux command line, you are going to be working in text.  I find its often easiest to write to files from within the terminal, even if I'm in a graphical environment with graphical editors available.  You don't need a mouse to get to it.

Today, some popular terminal-based text editors in this realm are emacs, vi/vim, nano, pico, gedit.
I some times hear Vi enthusiasts boast that if you know how to use Vi, you are covered on any
Linux machine. Thats the case so far for me, and the others do vary more in terms of availability.
I like Vi because it led me naturally down the path of putting as many commands in the same typing area
as possible, which obviates excess repetitive movement.

That said, some people feel equally at home with Emacs or something else.  Just realize that choosing a text editor is an investment.  You can do so much more once you learn the ways of a powerful editor, though it may not seem intuitive at first, that the learning curve is often justified.

#### THE LINUX COMMAND LINE

The command line environment is a mostly textual representation of the parts of the operating system that are exposed to you.  You are provided with a terminal console environment that will attempt to execute any text commands you type.
The commands you type are just strings that are handed to the Operating System which specify precisely what it should carry out.  The OS then performs the tasks to the best of its ability given the context of the user and the commands passed.

Here's an example of a command that renames a file a.txt to b.txt. ('we're assuming that a.txt exists already').  Note that there is no output after the command ran.  A general convention in Linux software is to generally output user-directed messages to indicate problems or warnings but not successes.

```bash
userA@systemD:~$ mv a.txt b.txt
userA@systemD:~$
```

if I try that again:

```bash
userA@systemD:~$ mv a.txt b.txt
mv: rename a.txt to b.txt: No such file or directory
```
we see this convention in action.  The second time I try to move **a.txt** to **b.txt**, the **mv** program speaks up because **a.txt** no longer exists.


#### UNIX PHILOSOPHY AND TOOL CHAIN

The Unix philosophy emphasizes the idea that you can accomplish sophisticated tasks by combining
 a sequence of small or single-purpose tools instead of building a single large monolithic,
do-everything tool. On the command line, this comes into play when you want to manipulate some text,
for example.  Instead of looking for a tool that does exactly what you want, you can assemble some
smaller programs to do something to the text and pass it on to the next one.

Here, I want to find the size and name of each file in my current directory and sort it by size with
the largest at the bottom.

```bash
userA@machineD:~$ ls -l | tr -s ' ' | tr ' ' '\t' | cut -f5,9 -d$'\t' | sort -nr -k1
0       script.js
1038    command_line_index.html
122     sync.sh
14703   tutorial.html
15487   linuxfs.png
2176    style.css
2752    REVISED_TEXT.txt
2936    hilitor.js
```


#### THE LINUX FILESYSTEM STRUCTURE

The Linux Filesystem is a <tree> structure.  The 'root' of this tree is called
the <top level> and is not contained in any other directory. Everything else is
contained in it directly or indirectly by being contained in another folder
contained within the root, which is referred to as **/**.  

A **filepath** locates a file.  If it begins with '/', it denotes the file's full path relative to the root.  
If it begins without '/', then it denotes a file relative to the current directory. 

In the following example, I use **ls** to find the files located in a directory that is named 'bin', but depending on the presence of the leading slash, I get different results.

```bash
userA@machineD:~$ ls bin
userA@machineD:~$ ls /bin
bash          bzless     date           false       hostname  loadkeys     mountpoint      open      rmdir       su               unicode_start  zless
bunzip2       bzmore     dd             fbset       ip        login        mt              openvt    rnano       sync             vdir           zmore
bzcat         cat        df             fgconsole   kbd_mode  ls           mt-gnu          pidof     run-parts   tailf            which          znew
bzcmp         chgrp      dir            fgrep       kill      lsblk        mv              ping      sed         tar              ypdomainname
bzdiff        chmod      dmesg          findmnt     kmod      lsmod        nano            ping6     setfont     tempfile         zcat
bzegrep       chown      dnsdomainname  fuser       less      mkdir        nc              plymouth  setupcon    touch            zcmp
bzexe         chvt       domainname     fusermount  lessecho  mknod        nc.openbsd      ps        sh          true             zdiff
bzfgrep       con2fbmap  dumpkeys       grep        lessfile  mktemp       nc.traditional  pwd       sh.distrib  ulockmgr_server  zegrep
bzgrep        cp         echo           gunzip      lesskey   modeline2fb  netcat          rbash     sleep       umount           zfgrep
bzip2         cpio       ed             gzexe       lesspipe  more         netstat         readlink  ss          uname            zforce
bzip2recover  dash       egrep          gzip        ln        mount        nisdomainname   rm        stty        uncompress       zgrep

```

All directories below the root are separated by **/**.  Together, they make up a **filepath**.  If the filepath ends in a filename
The default login location for a normal user is located inside of **/home**.
The 'userA' directory is inside of 'home', which is inside of '/'.


A file is a sequence of bytes that the program is in charge of making sense of.  File-extensions
are not by design required for filetype identification by the Operating System. It leaves this up
to the application. Despite this, file-extensions are frequently used.

A directory is a file that lists all of the files it contains, including other directories. Returning
to the tree design, a directory can be considered a node and a file a leaf.

IMG[linuxfs.png]
ENDIMG


#### REDIRECTION and PIPES
#### ENVIRONMENT VARIABLES
#### NAVIGATING INFORMATION
#### MANIPULATING TEXT
#### USERS, GROUPS, PERMISSIONS, SELINUX
#### LINKS/RESOURCES
#### BEST PRACTICES
