#!/bin/bash
#
# Regenrates a site's theme, clears the cache, resets admin password, reverts all features, clears the cache
# @param $1 the domain extension (i.e. local) 
# @param $2 the project short namee (i.e. crazyloki)
# @param $3 the site subdomain (i.e. simba)
# @param $4 the theme to regenerate
echo "== I'm going to regenerate custom theme $4 on $3.$2.$1 ok? =="

echo "Calling compass..."
THEROOT=`drush @$3.$2.$1 dd`

compass compile $THEROOT/profiles/$2app/themes/custom/$4

echo "...Done!"
