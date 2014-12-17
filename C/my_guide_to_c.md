My Guide to C
=============

This is my guide to the fundamentals of C.  A work in progress.


# strings and arrays

#### to get the address of the first element in an array

```c
char letters[20];
printf("%c\n",&letters);

```

# Control Structures

#### case statement
```c
int x = 4;
switch (x)
{
    case 1:     printf("just one\n");
                break;
    case 4:     printf("four!\n");
                break;
    default:    printf("no match\n");
}   
```

running this gives:

```sh
$ ./case.c
four!
```

#### the if/else if/else construct

```c
if (expression that evaluates to true or false)
{
    statement1;
    statement2;
}
// runs if the first one isn't true and the condition in the if is met
else if(expression that evalues to true or false)
{
    statement1;
    statement2;
}
// runs if neither of the above run
else
    statement1;
    statement2;
    
```



# Working With Files

#### open a file for writing
```c
FILE * fp;
fp = fopen("file.txt","w");
fclose(fp);
```

#### open a file for writing in append mode
```c
FILE * fp;
fp = fopen("file.txt","a");
fclose(fp);
```

#### Write to a file (overwrites the file)
```c
FILE * fp;
fp = fopen("testfile.txt","w");
fprintf(fp,"%d %d %d %d",1,2,3,4);
fclose(fp);
```

#### Write to a file (appends to the end of the file)
```c
FILE * fp;
fp = fopen("testfile","a");
fprintf(fp,"hey there");
fclose(fp);
```

#### Write stdin to a stdout

```c
int c;
while ( (c=getc(stdin)) != EOF)
    putchar(c);
```

#### Write stdin to a file

```c
FILE * fp;
int c;
fp = fopen("textfile.txt","w");
while ( (c=getc(stdin)) != EOF)
    fprintf(fp,"%c",c);
fclose(fp);
```

# Passing Command-Line Arguments to Your C Program

#### argc, argv

**argc** is short for 'argument count', the number of arguments passed to the C program on execution.  If none are passed, argc is still 1 because the program is always passed its name.

**argv** is short for 'argument vector'.  It's an array that holds the arguments passed to the c program at execution.  They are char pointers ( char * ).  Think of argc as an array of strings that the Shell passes to your C program on the command line.

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

# Pointers

```c
int a = 120; // a holds the numeric value 120
int * p = &a; // p holds the address of a, not its value
printf("%p\n",p);
printf("%p\n",&a);
// 0x7fff7a9002a0
// 0x7fff7a9002a0

```

#### Pointer Arithmetic

```c
int nums[4] = {1,2,3,4};    // create an array of ints
int * nums_ptr;             // create a int pointer
nums_ptr = nums;            // point nums_ptr to array                                
// array w/out brackets is address of 1st elmt
printf("%d\n",*nums_ptr);   // print value at that address with *
printf("%d\n",*nums_ptr+1); // print value-at offset by one int's size
printf("%d\n",*nums_ptr+2);
printf("%d\n",*nums_ptr+3);
return 0;

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

# Compiling a Multiple-file Program

In the following example:

+ we compile it like this: 
```c
gcc -Wall main.c funcs.c
```
+ the main.c file calls a function from another file, funcs.c. 
+ The main.c file doesn't reference funcs.c in its source code because that job is done by the compiler when you call cc like I did above. 
+ main.c only needs the basic function protopype of the function in funcs.c, which I've put in the header file, funcs.h
+ we didn't need the header file, we could have put the definition of funcs.h at the top of main.c, but it makes for a cleaner organization when you write non-trivial programs.

My Main C File:

```c

#include    <stdio.h>
#include    "funcs.h"

extern int count;

int
main()
{
    addOne();
    printf("%d\n",count);
    return 0;
}
```
The file with the addOne function

```c
#include    <stdio.h>

int count = 0;

void addOne()
{
    count+=1;
}
```

The file that declares the addOne() function
```c
void addOne();
```

## Programming Examples

#### reverse a string

Preliminary proof of concepts

```c
char * str = "reverse me";
long unsigned len = strlen(str); // length of string, not including terminating '\n'
printf("%p\n",str+len-1); // address of last char; len-1 because it's the offset from the first char
printf("%c\n",*(str+len-1)); // verifies it's an e.
printf("%c\n",*(str+len-2)); // verifies it's an m.

```
The full example:

```c
#include    <stdio.h>
#include    <string.h>

int main()
{
    char * str = "reverse me";
    long unsigned len = strlen(str);

    // len -1 because we already start at the first letter

    char * end;
    char * start;
    // while end addr is greater than the start addr, print char at that addr and decrement end
    for ( end = (str+len-1), start = str; end >= start; end--) 
       putchar(c);
    return 0;
}
```
#### Linked List of Students

```c
#include    <stdio.h>
#define     SIZE    40

struct student
{
    int id;
    struct student * next;
};

int
main()
{
    // create an array of student structs called class
    struct student class[SIZE];
    struct student * cur = NULL;
    struct student * prev = NULL;
    
    

    // populate those structs with data
    // for simplicity's sake, the id increments with the for loop

    int i;
    for (i=0; i<SIZE;i++)
    {
       cur = &class[i];
       class[i].id = 1000 + i;
       if (prev != NULL)
            prev->next = cur;
       cur->next = NULL;
       prev = &class[i];
    }

    // traverse the list
    // for each student, the last student's address should point to it
    struct student * trav_p;
    for (trav_p = &class[0];  trav_p != NULL; trav_p = trav_p->next)
        printf("%d\n",trav_p->id);

    return 0;
}
```

# Malloc and Strings

```c
int main()
{
    char * str = "Happy Birthday!";
    char * p = malloc(sizeof(char)*strlen(str)+1); // number of chars in str + 1 for null
    strcpy(p,str);  // copy str into p's address
    printf("%s\n",p);

    return 0;
}
```


