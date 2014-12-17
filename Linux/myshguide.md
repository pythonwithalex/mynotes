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
