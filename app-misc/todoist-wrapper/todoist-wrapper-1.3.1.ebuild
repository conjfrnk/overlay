# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Electron Wrapper for Todoist"
HOMEPAGE="https://github.com/conjfrnk/todoist-wrapper"
SRC_URI="https://github.com/conjfrnk/todoist-wrapper/archive/refs/tags/v1.3.1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	net-libs/nodejs
	dev-vcs/git
"

src_install() {
	default

	cd "${S}"

	git checkout tags/v1.3.1

	npm install
	node_packages/.bin/electron-packager . --overwrite --platform=linux --arch=x64 --out=bin

	dobin bin/todoist-wrapper-linux-x64
}
