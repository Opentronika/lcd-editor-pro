#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
echo '' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io/<REPO>

git push -f https://github.com/lutgaru/lcd-editor-pro.git master:gh-pages
# git subtree push --prefix dist origin gh-pages
cd -


