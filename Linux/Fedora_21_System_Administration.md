## List of Topics

+ commands
+ creating partitions and filesystems
+ diagnosing
+ users and groups
+ apache
+ lamp
+ openldap
+ mail server (dovecot)
+ nfs

## Commands

**tar**: 

**zcat**: view a compressed log


## Installation 

**kickstart**: Using kickstart, a system administrator can create a single file containing the answers to all the questions that would normally be asked during a typical installation.

## Users and Groups

/etc/passwd
each user gets an identically named group account


#### OpenLDAP
LDAP: Light Weight Access Protocol

OpenLDAP Runs over TCP/IP
[ref: https://sites.google.com/site/openldaptutorial/Home/openldap---beginners/benefits]

OpenLdap is implemented as a database. 
mostly reads, not so many modifications/writes.
add info once, use for authentication many places.
convenient restrictions for anonymous and regular users.

Purpose: "used to authenticate from a single and common base of information regardless of location or application"

**Terminology**
+ Entry/Object: a node in the Directory Information Tree
+ Directory Information Tree: The Entire Database
+ Root DSE: head node
+ entry
+ distinguised name, DN
+ attribute
+ objectclasses
+ schema

Schema Files provide the structure/ container for the database
The schema files store the attributes and object classes
schema file examples: misc.schema, inetorgperson.schema, nis.schema

objectclasses determine which node, attributes determine what its properties (key-value pairs) are
