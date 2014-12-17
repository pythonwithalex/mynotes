## Function List w/ signatures

```c
sscanf(str,"format string"); // const char *restrict s, const char *restrict format, ... );
fgets(str,maxchars,stdin/stream);      //char *fgets(char *restrict s, int n, FILE *restrict stream);
strcpy(dest_string,src_string);
strcmp(str1,str2); // returns value that's <, == or  > 0 depending on whether str1 is <, ==, > str2
strncmp(str1,str2,num of chars to compare);
```

## strings and arrays

#### initializing an array

```c

int array[10] = { 0 };
// all elements initialized to 0
int array[10] = {1,2};
// first two are as they appear, rest initialized to 0
```

#### array length

```c
int array[5];
size_t len = sizeof(array)/sizeof(char);
printf("%lu\n",len);

```

#### address of the first element in an array

```c
char letters[20];
printf("%c\n",&letters);

```
## arrays and Strings

#### Malloc and Strings

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


## Control Structures

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


## Safe Methods of Taking User Input

```c
//fgets() + fscanf()
char line[256];
int i;
if (fgets(line, sizeof(line), stdin)) { // fgets is NULL if no input
    if (1 == sscanf(line, "%d", &i)) {
        /* i can be safely used */
    }
}
```

####  fgets, fscanf: a C pre-processor text-replacement method


```c
#define MAXLEN 20
#define MAXLEN_S "20"

fgets(stdin,
char buffer[MAXLEN+1];
sscanf(src, "%" MAXLEN_S "s", dest);
```

after the preprocessor replaces MAXLEN and MAXLEN_S, this becomes

```c
sscanf(src, "%" "20" "s", dest);
```

##  Working With Files

#### open a file for writing
```c
FILE * fp;
fp = fopen("file.txt","w"); //  "a" for append mode
fclose(fp);
```

#### Write to a file (overwrites the file)
```c
FILE * fp;
fp = fopen("testfile.txt","w"); //  "a" for append mode
fprintf(fp,"%d %d %d %d",1,2,3,4); 
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

## argc, argv


```c
  argc 1 -> argv[0]
  argc 2 -> argv[1]
```

#### check for an option

```c
int i;

for (i=1; i<argc; i++)
{ 
  if (strcmp(argv[i],"-o") == 0)
    printf("-o flag found: %s\n",argv[i]);
}
```

## Pointers

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
printf("%d\n",*nums_ptr+4); // print value-at offset by four int's size


```

```c
int a = 120;
int * p = &a;
printf("%p\n",p);
printf("%p\n",&a);
// 0x7fff7a9002a0
// 0x7fff7a9002a0

```

## Compiling a Multiple-file Program

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

Preliminary proofs of concept

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

** note ** this is missing lookup, replace, delete functions

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
    // for each student, the last student struct's next member should point to it
    struct student * trav_p;
    for (trav_p = &class[0];  trav_p != NULL; trav_p = trav_p->next)
        printf("%d\n",trav_p->id);

    return 0;
}
```

#### Linked List of Characters

```c

#include    <stdio.h>
#include    <stdlib.h>

struct charlink
{
    char c;
    struct charlink * next;
};


int main()
{
    // create and initialize the head struct, which is null by convention 
    struct charlink head;
    head.next = NULL;

    // declare char to hold c from standard in
    int c;

    // create a pointer that initially points to head
    struct charlink * prev = &head;

    // while data, generate a linked list 
    while ( (c=getchar()) != EOF)
    {
        // create pointer for new link we're about to make in the heap
        struct charlink * newcharlink;

        // malloc space for new link and check it is successful
        newcharlink = malloc(sizeof(struct charlink));
        if (newcharlink == NULL)
        {
            printf("couldn't make a new link.\n");
            exit(1);
        }

        // populate new link with the current stdin data
        newcharlink->c = c;

        //point previous link to this new link
        prev->next = newcharlink;

        // point next ptr of new link to null, it's at the end of the list
        newcharlink->next = NULL;

        // initially forgot this step. prev now becomes charlink
        // so that next run of loop treats this charlink as last one
        prev = newcharlink;
    }


    // create a pointer to traverse the list with
    struct charlink * trav_p;

    // set the pointer to the address of the head of the list
    // while trav_p points to something non-Null
    // print that struct's 'c' member
    // set trav_p to point to the address of it's next element
    printf("\n");
    for (trav_p = &head; trav_p->next != NULL; trav_p = trav_p->next)
        printf("%c",trav_p->c);
    printf("\n");
    return 0;
}

```


