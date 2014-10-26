#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the ~/Library/Application Support/Sublime Text 3/Packages/User directory 
# to any desired file in ~/sublime-settings
############################ 
# move all files from origional place 
  # /Library/Application Support/Sublime Text 3/Packages/User/
# to where you want them to be 
  # /sublime-settings
# symlink the new location to the old location 
  # /sublime-settings to /Library/Application Support/Sublime Text 3/Packages/User/
    # in old script it when from  /dotfiles to cd ..
    # so we do the opposit now... cd ../../../../../ to /sublime-settings
# symlinks are a way to access a file that isn't stored where you want to access it
# typically dotfiles need to stay put, thus if you want to move them symlinks are great!
# so anything that needs to be moved is a great canidatate, but what else?
# well you have aliases, variables and scripts that can be affected in a bash_profile but 
# what about sublime preferences you want to save???? This script does that...
# hell... it backs up the whole directory... recursivly... (soon to be impimented...)
dir=~/sublime-settings            # (where you want the real files to stay) 
olddir=~/sublime-settings_old       # old ../User_old backup directory     
files="Preferences.sublime-settings        
       Package Control.sublime-settings 
      "   
mkdir -p $olddir                                                                                        # makes folder to back up sublime-settings_old
cd $dir                                                                                                 # change to the sublime-settings directory

for file in $files; do     
    mv ~/Library/Application Support/Sublime Text 3/Packages/User/$file ~/sublime-settings_old/      # backup old....
    ln -s $dir/$file ~/Library/Application Support/Sublime Text 3/Packages/User/$file                # Creating symlink to $file in home directory
done
