$exists = git ls-remote template

if (-Not $exists) {
	git remote add template git@github.com:formula-open/template.git
}

git fetch template --prune
git merge template/master --allow-unrelated-histories
