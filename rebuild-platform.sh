#!/bin/bash
# 
# Rebuild a platform and relink sites folder
#
# @params $1 platform directory (i.e. loki-live)
#

echo "== I'm going to rebuild $1 ok? =="

echo "Create the temp directory if it ain't there..."
mkdir -p $HOME/temp 

source "$HOME/.diw-scripts/local-vars.sh"

echo "Storing sites folder in the sites bank..."
mv -f $diwant_platform_directory/$1/sites $HOME/temp/sites.$1

echo "Removing old platform..."
rm -Rf $diwant_platform_directory/$1 

echo "Make the new platform with drush make..."
drush make --working-copy  $HOME/build/build-$1.make $diwant_platform_directory/$1

echo "Remove the new sites directory..."
rm -Rf $diwant_platform_directory/$1/sites

echo "Bring back the sites directory..."
mv -f $HOME/temp/sites.$1 $diwant_platform_directory/$1/sites

echo "You should reinstall these sites..."
echo `ls $diwant_platform_directory/$1/sites/`

echo "...Done!"
