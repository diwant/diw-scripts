# !/bin/bash
# Regenrates a site's theme, clears the cache, resets admin password, reverts all features, clears the cache
# @param $1 the domain extension (i.e. local) 
# @param $2 the project short namee (i.e. crazyloki)
# @param $3 the site subdomain (i.e. simba)
# @param $4 the theme to regenerate

echo "== I'm going to reset $4 on $3.$2.$1 =="

echo "Regenerating the theme css..."
~/.diw-scripts/regen-compass.sh $1 $2 $3 $4

echo "Revert all features..."
drush @$3.$2.$1 fra -y

echo "Clear all caches..."
drush @$3.$2.$1 cc all
