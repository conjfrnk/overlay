# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Electron Wrapper for Todoist"
HOMEPAGE="https://github.com/conjfrnk/todoist-wrapper"
SRC_URI="https://github.com/conjfrnk/todoist-wrapper.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-lang/nodejs
	sys-devel/git
"

src_install() {
	git_clone

	cd "${S}"

	npm install
	npm run package-linux
	npm install -g .
}
