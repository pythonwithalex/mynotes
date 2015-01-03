Command Library
===============

#### renaming files in a directory to something much more structured

```bash
alexr@machine:$ count=0
alexr@machine:$ ls
AviaryCirculationConcept.jpg		CirculationPlan.jpg
CirculationConceptDiagram2.jpg		CirculationRender.jpg
CirculationDiagram.jpg			CirculationforCirculation.jpg
CirculationModel.jpg			DevotionalCirculationConcept.jpg
CirculationModel2.jpg
```

my script to rename these files:
```bash
#!/bin/bash

#FILE_EXT=$1
#SUFFIX_=$2

#echo $2
#exit

if test -z "$1"
then
  echo "usage: rename [file extension] [path]"
  exit 1
fi


read -p "This Utility takes all images in the current directory and renames them sequentially from 0 to N.  Rename is a suitable tool for working with copies of files. Ok? (y/N)" RESPONSE

if test -z "$(ls *.$1)"
then
  echo "no .$1 files here"
  exit 1
fi

case $RESPONSE in

  [^yY]*) echo "Bye"; exit 0 ;;

esac

COUNT=0;
for i in ./*.$1
do
  echo "$i" "$( echo "$i" | sed 's/.*.\('$1'\)/'$COUNT'_'$2'.\1/' )"
  COUNT=$(expr $COUNT + 1);
done;

exit 0
```

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
   
