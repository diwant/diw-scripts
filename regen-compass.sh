#!/bin/bash
#
# Regenrates a site's theme, clears the cache, resets admin password, reverts all features, clears the cache
# @param $1 the project short namee (i.e. crazyloki)
# @param $2 the project url (i.e. simba.local) 
# @param $3 the theme to regenerate
echo "== I'm going to regenerate custom theme $3 on $2 ($1) ok? =="

echo "Calling compass..."
THEROOT=`drush @$2 dd`

compass compile $THEROOT/profiles/$1app/themes/custom/$3

echo "Clear all caches..."
drush @$2 cc all

echo "...Done!"
