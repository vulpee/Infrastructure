#!/usr/bin/env bash

cd /var/www/vulpee/back-end

echo "### Printing dependency versions ###"
echo "node: `node -v`"
echo "npm: `npm -v`"

echo "### Getting the latest version via git ###"
git fetch origin
git reset origin/master --hard

echo "### Installing depenencies ###"
npm install

echo "### Building the app ###"
npm run build

echo "### Migrating the DB ###"
npm run db:migrate -- --force

echo "### Restart PM2 process ###"
env HOME=/var/www/vulpee/back-end/ pm2 restart vulpee-back-end

