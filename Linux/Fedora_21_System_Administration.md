#### List of Topics

+ commands
+ creating partitions and filesystems
+ diagnosing
+ users and groups
+ apache
+ lamp
+ openldap (or heimdal)
+ mail server (dovecot)
+ nfs

#### Commands

**tar**: 

**zcat**: view a compressed log


#### Installation 

**kickstart**: Using kickstart, a system administrator can create a single file containing the answers to all the questions that would normally be asked during a typical installation.

#### Users and Groups

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
+ Directory Information Tree
+ Root DSE
+ entry
+ distinguised name, DN
+ attribute
+ schema
