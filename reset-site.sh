#!/bin/bash
#
# Regenrates a site's theme, clears the cache, resets admin password, reverts all features, clears the cache
# @param $1 the project short namee (i.e. crazyloki)
# @param $2 the site url (i.e. simba.local) 
# @param $3 the theme to regenerate

echo "== I'm going to reset $3 on $2 ($1) =="

echo "Regenerating the theme css..."
$HOME/.diw-scripts/regen-compass.sh $1 $2 $3

echo "Revert all features..."
drush @$2 fra -y

echo "Clear all caches..."
drush @$2 cc all

source "$HOME/.diw-scripts/local-vars.sh"
if [ "$default_admin_password" != "" ]
then
  echo "Reset default admin password..."
  drush @$2 upwd admin --password=$default_admin_password
fi

echo "...Done"
