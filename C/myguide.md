My Guide to C
=============

## Pointers

// put cmgcasts in podlist,  plus magicjukebox.com

to get straight on pointers, it's important to get straight on variables.   Variables are the names we give to places in memory so we can refer to the values that the data there represents.  Variables point to a physical location in memory, but they have a human-friendly handle, a name.  They are of primary purpose because of the data they hold for us.

Obviously that didn't solve all the problems, though; software is a human problem.  you have to remember  your variable names, but not the layer of information beneath them -- the register location.  

Pointers store these registry locations.  They provide a kind of difficult but ultimately worth-it way of saving your system the work of having to copying large amounts of data.

```c
int a = 120;
int * p = &a;
printf("%p\n",p);
printf("%p\n",&a);
// 0x7fff7a9002a0
// 0x7fff7a9002a0

```




## USEFUL FUNCTIONS

```c
int c;
while ( (c = getc(FILE * STREAM) ) != EOF)
{
  putc(c);
}
```

#### open a file
```c
FILE * fp;
fp = fopen("file.txt","w");
fclose(fp);
```

#### Write to a file
```c
FILE * fileptr;
fileptr = fopen("testfile.txt","w+");
fprintf(fileptr,"%d %d %d %d",1,2,3,4);

```
or

```
#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE * fp;
    fp = fopen("testfile","a");
    fprintf(fp,"hey there");
    return 0;
}

```

## PROGRAM ARGUMENTS

#### argc, argv

**argc** is short for 'argument count', the number of arguments passed to the C program on execution.  If none are passed, argc is still 1 because the program is always passed its name.

**argv** is an array that holds these arguments.  They are char pointers ( char * ).  Think of argc as an array of strings that the Shell passes to your C program on the command line.

```c
  argc 1 -> argv[0]
  argc 2 -> argv[1]
```
...

check for an option

```c
int i;

for (i=1; i<argc; i++)
{ 
  if (strcmp(argv[i],"-o") == 0)
    printf("-o flag found: %s\n",argv[i]);
}
```
