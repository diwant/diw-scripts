#!/bin/bash
# 
# Reinstall a site and remake compass css etc 
# @param $1 the project short namee (i.e. crazyloki)
# @param $2 the url (i.e. simba.local) 
# @param $3 the theme to regenerate
#
echo "== I'm going to reinstall $2 ($1) and regenerate the $3 theme ok? =="

echo "Calling site install..."
drush @$2 si $1app --sites-subdir="$2" -y --working-copy

$HOME/.diw-scripts/reset-site.sh $1 $2 $3

echo "...Done!"
