# !/bin/bash
#
# Reinstall a site and remake compass css etc 
# 
# @params $1 domain of site to reinstall (i.e. crazyloki.local)
# @params $2 name of profile to install the site with 
#
echo "== I'm going to reinstall $1 with $2 ok? =="

echo "Calling site install..."
drush @$1 si $2 --sites-subdir="$1" -y --working-copy

echo "Revert all features..."
drush @$1 fra -y

echo "Run compass..."
compass compile `drush @$1 dd`/profiles/$2/themes

echo "...Done!"
