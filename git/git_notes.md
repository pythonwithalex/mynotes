GIT NOTES
=========

#### Show file from previous commit git show HEAD:/path/to/file example:
  git show d8b41cf0c78cedb8166b7071fadceb0bd7b3e089:wlfiler6/wlfiler6.c

#### Reset git log back to previous commit, erase all since then 
  git reset --hard HEAD git reset --hard d8b41cf0c78cedb8166b7071fadceb0bd7b3e089:wlfiler6/wlfiler6.c

#### Which branch am I on? 

  git branch

#### Create a new branch 

  git branch experimental

#### Checkout a branch 
  git checkout experimental
  git branch experimental