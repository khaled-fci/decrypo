GITHUB_REPO="ajdnik/decrypo"
VERSION="0.2.15"

changelog:
	git-chglog -c .chglog/changelog/config.yml -o CHANGELOG.md --next-tag ${VERSION} ..${VERSION}

devdeps:
	go get -u github.com/git-chglog/git-chglog/cmd/git-chglog

tag: changelog
	git add CHANGELOG.md
	git commit -m "chore: updated changelog"
	git add Makefile
	git commit -m "chore: version bumped"
	git push
	git tag ${VERSION}
	git push origin ${VERSION}

default: changelog

.PHONY: changelog devdeps release
