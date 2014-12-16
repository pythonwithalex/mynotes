My Guide to C
=============

#### argc, argv

Argc is the number of arguments passed to the C program on execution.  If none are passed, argc is 1 because it is always passed its own name.
argv is an array that holds these arguments.

when checking arguments for flags, do

```c
int i;

for (i=1; i< argc; i++)
{ 
  if (strcmp(argv[i],"-o") == 0)
    printf("argument: %s\n",argv[i]);
}
```
