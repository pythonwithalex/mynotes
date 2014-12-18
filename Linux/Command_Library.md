Command Library
===============

#### floating point expressions
```sh
    echo "60 / 4.3" | bc -l
```

#### file usage on your user account
```sh
    du -sk -- .??* * | sort -n 
```
Commands


        cat  /proc/dma
        cat  /proc/ioports
        cat  /proc/interrupts
        lsusb -t
        lsdev
        lspci
        lsmod
        insmod -s, -v
        rmmod
        modprobe -a,-l,-r,-t
        
        ls -R recursive listing of all nodes contained w/ in a dir
        cp
        ls
        mv
        touch
        mkdirs
        rmdir
        
        cat -E 
        cat -b 
        cat -n
        
        tac (reverse of cat, prints file in reverse order, YEAH!)
        
        diff
        patch
        
        grep -C
        grep -A
        grep -B
        grep -m
        
        ls -lu 	long format, u is for when file was last modified (ex. permission modes)
        ls -F appends symbol to end of each file to indicate what it is
        ls -c 	c time, last file modification
        
        cat
        tac
        
        readlink -f <filename> [returns the absolute file path of a filename ]
        expand -  turns tabs to spaces, use -t=<int> to set how many spaces a tab equals
        
        xargs [ turns stdin into command line arguments]
        e

