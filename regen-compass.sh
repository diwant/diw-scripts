# !/bin/bash
#
# Regenerate compass css files
# 
# @params $1 domain of site to regen (i.e. crazyloki.local)
# @params $2 name of theme to regenerate css for 
# @params $3 name of the profile that has theme
#
echo "== I'm going to regenerate $3 on $1 in $2 ok? =="

echo "Calling compass on $3..."
THEROOT=`drush @$1 dd`
echo `ls $THEROOT/profiles/$2/themes`
compass compile $THEROOT/profiles/$2/themes/$3

echo "...Done!"
