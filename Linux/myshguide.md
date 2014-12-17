My sh (Bourne Shell) Guide
==========================
## Logical Operators

```sh
#!/bin/sh
test 1 -eq 0
test $? -eq 0 || echo 'abc'
```

## case statement

#!/bin/sh

max=1
```sh
#!/bin/sh

case $max in
    '1')  echo "its one";;
     *)   echo "its not one";;
esac
```
## while loop

```sh
#!/bin/sh
# usage: countdown <num>

max=$1

while test $max -ne 0
do
    echo $max
    max=$(expr $max - 1)
done
```
now, run this:

```sh
$ sh ./countdown.sh 10
10
9
8
7
6
5
4
3
2
1
```

## environment values

#### get PID of current shell
```sh
$ echo $$
# 8606
```
#### get return value of last command
```sh
$ echo $?
# 0
```
