## A Practical Guide to The Linux Command Line

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
The commands you type are just strings that are handed to the Operating System wich specify precisely what it should carry out.  The OS then performs the tasks to the best of its ability given the context of the user and the commands passed.

Here's an example of a command that renames a file **a.txt** to **b.txt** (We're assuming that a.txt exists already).  Note that there is no output after the command ran.  A general convention in Linux software is to generally output user-directed messages to indicate problems or warnings but not successes.

```bash
userA@systemD:~$ mv a.txt b.txt
userA@systemD:~$
```

if I try that again:

```bash
userA@systemD:~$ mv a.txt b.txt
mv: rename a.txt to b.txt: No such file or directory
```

we see this convention in action.


#### UNIX PHILOSOPHY AND TOOL CHAIN

The Unix philosophy emphasizes the idea that you can accomplish sophisticated tasks by combining
 a sequence of small or single-purpose tools instead of building a single large monolithic,
do-everything tool. On the command line, this comes into play when you want to manipulate some text,
for example.  Instead of looking for a tool that does exactly what you want, you can assemble some
smaller programs to do something to the text and pass it on to the next one.

Here, I want to find the size and name of each file in my current directory and sort it by size with
the largest at the descending.

```bash
userA@machineD:~$ ls -l | tr -s ' ' | tr ' ' '\t' | cut -f5,9 -d$'\t' | sort -nrk1
0       script.js
1038    command_line_index.html
122     sync.sh
14703   tutorial.html
15487   linuxfs.png
2176    style.css
2752    REVISED_TEXT.txt
2936    hilitor.js
```


#### THE LINUX FILESYSTEM HIERARCHY

The Linux Filesystem is a <tree> structure.  The 'root' of this tree is called
the <top level> and is not contained in any other directory. Everything else is
contained in it directly or indirectly by being contained in another folder
contained within the root.

The root directory is located here: /

The default login location for a normal user is here: /home/userA

The 'userA' directory is inside of 'home', which is inside of '/'.


A file is a sequence of bytes that the program is in charge of making sense of.  File-extensions
are not by design required for filetype identification by the Operating System. It leaves this up
to the application. Despite this, file-extensions are frequently used.

A directory is a file that lists all of the files it contains, including other directories. Returning
to the tree design, a directory can be considered a node and a file a leaf.


#### REDIRECTION & PIPES
#### ENVIRONMENT VARIABLES
#### NAVIGATING INFORMATION
#### MANIPULATING TEXT
#### USERS, GROUPS, PERMISSIONS, SELINUX
#### LINKS/RESOURCES
#### BEST PRACTICES
