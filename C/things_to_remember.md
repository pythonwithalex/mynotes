C :  things to remember

SSCANF FAMILY FORMATTING
to scan 'name=value;' string into name,value variables:

sscanf(field," %[^=] %*c %s ",name,value);
%[^=] // scan anything that's not an equals char and stop at the first equals char
%*c // scan and ignore a char (equals in this case)
%s // scan a string

fscanf(fp,"%[^;];",field)
scan up to the first ';' and stop there

EXTERN VARS
use them normally in other 'translation units', but declare them 'extern type name' in the file you want to use.

scope.c
~~~~~~~~
int g = 1;

main.c
~~~~~~
extern int g;
printf("%d\n",g++);





use strlen when malloc'ing strings
char * s_ptr = malloc(strlen(str)+1); // +1 for null byte 


strcpy,strncpy ( the destination goes first!!!)
strncpy(dest_array,src_array,strlen(src_array))

INITIALIZING AN ARRAY
char buffer_array[WIDTH] = { '\0' };
char buffer_array[WIDTH][MAXFLDLEN] = { {'\0'},{'\0'} };  /// multi-dimensional initialization
memset(buffer_array, 0, WIDTH);

function signature for single element array
int * state, not char state[].

STRING LITERALS
char str[] = "example string";
compiler treats it like char *, which points to a memory location that contains the string followed by a null.

arrays: allocate space but can't be relocated or resized
pointers: can't change the location of their allocation, but they can point to new things at will

decay isn't recursive, so when passing a multidimensional array to function, like this:

f(  int a[][NCOLUMNS] ), which means pointer to array

you get a pointer to an array

arrays and pointers not equivalent, though there are practical situations in which you can treat them the same
"arrays decaying into pointers" means that the array loses its dimension information and is treated as just a pointer/mem adde
an array isn't passed into a function, it 'decays' into a pointer,  so you can put char * a in a function declaration if it takes in a char a[] because the array isn't passed, only the address that a starts at is.

sizeof doesn't tell you size of an array

read that to understand diffs between char a[6] = 'stuff'; and char *a = 'stuff';

struct
consist of data and pointers to functions


c = c - '0' 

print an 'A' as an integer, get the ascii value
print an 'A' as a char, get the char 'a'.


* general approximations on most systems *
bool  - 
char: 256 characters total ( 1 byte, 2^8) 
short - 2bytes (2^16)
int - 4 bytes (2 ^32)
long - 4 bytes
float - 4 bytes 
double - 8 bytes

FOR loops:

c99: can declare value of i inside, like for (int i=0; ....
comma expression 
  void rev(char *s, size_t len)
{
    char *first;
    for (first = s, s += len - 1; s >= first; --s)
        putchar(*s);
}

first value is evaluated and then used by the second 


LEFT vs RIGHT ASSOCIATIVE

!num, ! is right associative bc the symbol takes the right argument as argument
&&,|| are left associative,e.g. (2>0) && (1 == 4), bc the && symbols take the left hand as their first arguments
