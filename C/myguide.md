My Guide to C
=============

## USEFUL FUNCTIONS

```c
int c;
getc(FILE * STREAM);
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

## PROGRAM ARGUMENTS

#### argc, argv

**argc** is short for 'argument count', the number of arguments passed to the C program on execution.  If none are passed, argc is still 1 because the program is always passed its name.

**argv** is an array that holds these arguments.  They are char pointers ( char * ).  Think of argc as an array of strings that the Shell passes to your C program on the command line.

argc 1 -> argv[0]

argc 2 -> argv[1]

...

when checking arguments for flags, do

```c
int i;

for (i=1; i<argc; i++)
{ 
  if (strcmp(argv[i],"-o") == 0)
    printf("-o flag found: %s\n",argv[i]);
}
```
