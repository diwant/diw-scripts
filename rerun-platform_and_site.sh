#!/bin/bash
#
# Rebuild a platform and reinstall a specific site on it.  Good for checking installation profiles.
# @param $1 the project platform name (like cc-sandbox)
# @param $2 the extension (like 'local')
# @param $3 the domain (like 'colitiscompound')
# @param $4 the site name (like 'simba')
# @param $5 the theme name (like 'cc-mac')

echo "= Going to rebuild $1 and then reset $4.$3.$2 (including regenerate $1) ="

echo "Rebuilding platform..."
$HOME/.diw-scripts/rebuild-platform.sh $1

echo "Resetting site..."
$HOME/.diw-scripts/reset-site.sh $2 $3 $4 $5

echo "... Done"
