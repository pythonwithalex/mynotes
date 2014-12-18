GIT NOTES
=========

#### sets your user values
    git config --global <key> <value>

#### get help
    hit help <verb>, e.g. 'git help config'

#### add file to staging area
    git add <file>
    
#### find out what's changed but not's changed, and what you've staged and are about to commit
git diff
    note: only shows you files that are UNSTAGED since last
    commit.  Use 'git diff --cached or git diff --staged' for that.

#### git mv file.txt file
    equivalent to the following:
    $ mv README.txt README
    $ git rm README.txt
    $ git add README
    
#### Show file from previous commit git show HEAD:/path/to/file example:
    git show <commit hash>:<path to file>

#### Reset git log back to previous commit, erase all since then 
    git reset --hard <commit hash>:<path to file> 
  
    e.g. git reset --hard d8b41cf0c78cedb8166b7071fadceb0bd7b3e089:wlfiler6/wlfiler6.c

#### Which branch am I on? 
    git branch

#### Create a new branch 
    git branch <new branch name>
  
    e.g. git branch experimental

#### Checkout a branch 
    git checkout <new branch name>
  
    e.g. git branch experimental
