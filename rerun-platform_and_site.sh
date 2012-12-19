#!/bin/bash
#
# Rebuild a platform and reinstall a specific site on it.  Good for checking installation profiles.
# @param $1 the project platform name (like cc-sandbox)
# @param $2 the project short name/domain (like 'colitiscompound')
# @param $3 the site url (like 'simba.local')
# @param $4 the theme name (like 'cc-mac')

echo "= Going to rebuild $1 and then reset $3 ($2) (including regenerate $4) ="

echo "Rebuilding platform..."
$HOME/.diw-scripts/rebuild-platform.sh $1

echo "Resetting site..."
$HOME/.diw-scripts/reset-site.sh $2 $3 $4 

echo "... Done"
