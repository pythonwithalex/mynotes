My sh (Bourne Shell) Guide
==========================

## while loop

```sh
#!/bin/sh

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
