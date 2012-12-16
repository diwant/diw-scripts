# !/bin/bash
#
# Regenerate compass css files
# 
# @params $1 domain of site to regen (i.e. crazyloki.local)
# @params $2 name of the profile that has the theme in it's custom folder 
# @params $3 name of the theme
#
echo "== I'm going to regenerate $3 on $1 in $2 ok? =="

echo "Calling compass on $3..."
THEROOT=`drush @$1 dd`
compass compile $THEROOT/profiles/$2/themes/custom/$3

echo "...Done!"
