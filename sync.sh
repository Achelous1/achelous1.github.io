bundle exec jekyll build

rm -fR /tmp/publish
mkdir -p /tmp/publish
cp -r _site/* /tmp/publish

rm -fR /tmp/master
mkdir -p /tmp/master
cd /tmp/master

git clone https://${gh_user}:${gh_pw}@github.com/${gh_user}/${gh_repo}
cd ${gh_repo}
git rm . -r
cp -r /tmp/publish/* ./
git add .
git commit -m "updated"
git push