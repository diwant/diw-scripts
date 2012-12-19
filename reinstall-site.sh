#!/bin/bash
# 
# Reinstall a site and remake compass css etc 
# @param $1 the project short namee (i.e. crazyloki)
# @param $2 the url (i.e. simba.local) 
#
echo "== I'm going to reinstall $2 ($1) ok? =="

echo "Calling site install..."
drush @$2 si $1app --sites-subdir="$2" -y --working-copy

echo "...Done!"
