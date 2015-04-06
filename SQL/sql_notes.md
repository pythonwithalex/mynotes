## SQLNOTES

+ row = record
+ column = data item


````bash

a@b: ~$ mysql 
>>> CREATE DATABASE contacts;
>>> quit;
a@b: ~$ mysql 
>>> use contacts;
>>> show tables;
>>> CREATE TABLE colleagues;

````
## data types

+ varchar is an estimate of size, e.g. "city varchar(40) not null"

+ char is an exact specification of size, eg "state char(2) not null default 'MA'"

+ ENUM gives you specific options, e.g. "sex ENUM('M','F')"

primary key: unique to a row, can't be null
