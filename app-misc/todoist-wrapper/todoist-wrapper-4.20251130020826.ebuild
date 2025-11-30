# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Electron Wrapper for Todoist"
HOMEPAGE="https://github.com/conjfrnk/todoist-wrapper"
SRC_URI="https://github.com/conjfrnk/todoist-wrapper/releases/download/v4.20251130020826/todoist-wrapper-linux-x64.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/bin/todoist-wrapper-linux-x64"

DEPEND="
	app-arch/unzip
"

src_install() {
	dodir /opt/todoist-wrapper

	unpack todoist-wrapper-linux-x64.zip

    dodir /opt/todoist-wrapper
    cp -r "${S}"/* "${D}/opt/todoist-wrapper/" || die "Failed to copy files."

    fperms +x /opt/todoist-wrapper/todoist-wrapper

    dosym /opt/todoist-wrapper/todoist-wrapper /usr/bin/todoist-wrapper
}
