### list all the branch
git branch -a

### Configure your Git username/email
git config --global user.name "Merluise Tia"
git config --global user.email "merluise.tia@mbusa.com"

### To list the global configuration
git config --list

### Delete a feature branch
git branch -D feature/EC-2511

### Create a feature branch
git branch feature/EC-3060

### Push a branch 
git push origin feature/EC-3060


### delete branch locally
git branch -d localBranchName

### delete branch remotely
git push origin --delete remoteBranchName

### Add you indentity into git 
git config --global user.name "Merluise Tia"
git config --global user.email merluise.tia@pearson.com

### How do I show my global Git configuration?
git config --list
git config --edit --global
cat ~/.gitconfig

### Git Basics - Tagging
git tag -a v1.4 -m "my version 1.4"
git tag
git show v1.4


### Renaming Git Branch
- Follow the steps below to rename a Local and Remote Git Branch:

* list all the branches
git branch -a

* Start by switching to the local branch which you want to rename:
git checkout <old_name>

* Rename the local branch by typing:
git branch -m <new_name>

* Push the <new_name> local branch and reset the upstream branch:
git push origin -u <new_name>

* Delete the <old_name> remote branch:
git push origin --delete <old_name>