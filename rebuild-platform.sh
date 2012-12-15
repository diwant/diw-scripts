# !/bin/bash
#
# Rebuild a platform and relink sites folder
# 
# @params $1 platform directory (i.e. loki-live)
#

echo "== I'm going to rebuild $1 ok? =="

echo "Create the temp directory if it ain't there..."
mkdir -p /var/aegir/temp 

echo "Storing sites folder in the sites bank..."
mv -f /var/aegir/platforms/$1/sites /var/aegir/temp/sites.$1

echo "Removing old platform..."
rm -Rf /var/aegir/platforms/$1 

echo "Make the new platform with drush make..."
drush make --working-copy  /home/vagrant/code/build/build-$1.make /var/aegir/platforms/$1

echo "Remove the new sites directory..."
rm -Rf /var/aegir/platforms/$1/sites

echo "Bring back the sites directory..."
mv -f /var/aegir/temp/sites.$1 /var/aegir/platforms/$1/sites

echo "You should reinstall these sites..."
echo `ls /var/aegir/platforms/$1/sites/`

echo "...Done!"
