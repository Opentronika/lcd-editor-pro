#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
echo '' > CNAME

git add -A
git commit -m 'deploy'

cd -
# if you are deploying to https://<USERNAME>.github.io/<REPO>

git push origin `git subtree pull --allow-unrelated-histories --prefix dist origin gh-pages`:gh-pages --force
# git subtree push --prefix dist origin gh-pages


