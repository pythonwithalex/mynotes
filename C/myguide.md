My Guide to C
=============

## Pointers

```c
int a = 120; // a holds the numeric value 120
int * p = &a; // p holds the address of a, not its value
printf("%p\n",p);
printf("%p\n",&a);
// 0x7fff7a9002a0
// 0x7fff7a9002a0

```

#### variables
to get straight on pointers, it's important to get straight on variables.   Variables are the names for places in memory.  We want to refer to those values whenever we want, so we write some code that works with various places in memory and the programming lanaguage software to name and keep track of those values. A variable points to a physical location in memory, but they have that human-friendly handle we know by name. the name!  They are of primary purpose because of the data they hold for us.

In C each variable has an address

#### history
C has been around for a while, though, and reflects a much more resource-restricted computing history.  The way you get data from one function to another is by copying it, which is a memory-and-space costly affair. Pointers provide direct access to the specified location in memory and the value in it.  In some sense they are global.

#### points to hardware
A pointer is a variable holds a thing that points to hardware.

You can return a struct from a C function but you can't return an array.  

You don't have to remember 0x7fff7a9002a0. You probably can remember 'p'.

Except when you are using a programming language that originated in XXXX when the amount of memory was supposedly scarce.

Is what it holds.  
An int holds a number.  A pointer holds a number, too.  A pointer holds Pointers are variables whose data is a number that identifies a physical place in your computer. They complement C's scoping rules, allowing you to  .  they have a kind of heavy baggage with some folks, but 

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
