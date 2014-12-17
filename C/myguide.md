My Guide to C
=============

## USEFUL FUNCTIONS

getc(FILE * STREAM)

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

**argc** is the number of arguments passed to the C program on execution.  If none are passed, argc is 1 because it is always passed its own name.

**argv** is an array that holds these arguments.  They are char pointers ( aka, char *).  You can think of them as an array of arrays(null terminated arrays, aka strings).

when checking arguments for flags, do

```c
int i;

for (i=1; i<argc; i++)
{ 
  if (strcmp(argv[i],"-o") == 0)
    printf("-o flag found: %s\n",argv[i]);
}
```
