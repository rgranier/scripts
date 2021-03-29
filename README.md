# Script Collection

# TODO
We lose the ubuntu@server in the prompt with the git bash profile.
\u@\h


## General Instructions
This repo needs to be cloned on all servers.

## repo
https://github.com/rgranier/scripts.git




## Auth and Cheats
### For the first commit on the Ubuntu server
git config --global user.email "rgranier@gmail.com"
git config --global user.name "Randall Granier"

### For the first push from Ubuntu server
SecureCRT buttons are configured.

Ensure git is installed, which it should be for Ubuntu 18.04
When this is cloned, it makes the scripts directory.
Do this under the ubuntu user, not root

NOTE:  Ubuntu 18 is not set up by default with the nice git profile that
shows the branch in the path.

git clone https://github.com/rgranier/scripts.git


# GENERAL CHEATS
### sets up Git with your name
git config --global user.name "<Your-Full-Name>"

### sets up Git with your email
git config --global user.email "<your-email-address>"

### makes sure that Git output is colored
git config --global color.ui auto

### displays the original state in a conflict
git config --global merge.conflictstyle diff3

git config --list
