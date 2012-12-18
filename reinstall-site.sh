# !/bin/bash
# 
# Reinstall a site and remake compass css etc 
# @param $1 the domain extension (i.e. local) 
# @param $2 the project short namee (i.e. crazyloki)
# @param $3 the site subdomain (i.e. simba)
# @param $4 the theme to regenerate
#
echo "== I'm going to reinstall $3.$2.$1 and regenerate the $4 theme ok? =="

echo "Calling site install..."
drush @$3.$2.$1 si $2app --sites-subdir="$3.$2.$1" -y --working-copy

~/.diw-scripts/regenerate-compass.sh $1 $2 $3 $4

echo "...Done!"
