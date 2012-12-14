# !/bin/bash
#
# Rebuild a platform and relink sites folder
# 
# @params $1 platform directory (i.e. loki-live)
#

echo "== I'm going to rebuild $1 ok? =="

echo "Removing old platform..."
rm -Rf /var/aegir/platforms/$1 

echo "Make the new platform with drush make..."
drush make --working-copy  /home/vagrant/code/build/build-$1.make /var/aegir/platforms/$1

echo "Remove the new sites directory..."
rm -Rf /var/aegir/platforms/$1/sites

echo "Symlink the sites directory from the platform store..."
ln -s /var/aegir/platforms/sites-bank/sites.$1 /var/aegir/platforms/$1/sites 

echo "You should reinstall these sites..."
echo `ls /var/aegir/platforms/$1/sites/`

echo "...Done!"
