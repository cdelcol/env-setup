This repo, in theory, allows me to get most of my settings back in the even of catastrophe. Once you run the build script it creates symbolic links for everything right to your repo. So when you make updates, just update and push and you never have to worry about being out of sync again.

#Get up and running
Clone this replo to a permanent location
./configure
grunt

#Todo (things that are not yet done)
##VIM stuff

Requirements:

Ack plugin:

NOTE: You must, of course, install the ack script
in your path.
On Ubuntu:
sudo apt-get install ack-grep
ln -s /usr/bin/ack-grep /usr/bin/ack
With MacPorts:
sudo port install p5-app-acki

##Other files
bash_profile and git settings are here as well to make things easier when setting up a new development machine.

##General Cleanup
