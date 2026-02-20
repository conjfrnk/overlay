# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Electron Wrapper for Todoist"
HOMEPAGE="https://github.com/conjfrnk/todoist-wrapper"
SRC_URI="https://github.com/conjfrnk/todoist-wrapper/releases/download/v4.20260220023612/todoist-wrapper-linux-x64.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/todoist-wrapper-linux-x64"

DEPEND="
	app-arch/unzip
"

# Electron binaries come pre-stripped from upstream
QA_PRESTRIPPED="
	opt/todoist-wrapper/chrome_crashpad_handler
	opt/todoist-wrapper/chrome-sandbox
	opt/todoist-wrapper/libEGL.so
	opt/todoist-wrapper/libGLESv2.so
	opt/todoist-wrapper/libffmpeg.so
	opt/todoist-wrapper/libvk_swiftshader.so
	opt/todoist-wrapper/libvulkan.so.1
	opt/todoist-wrapper/todoist-wrapper
"

src_unpack() {
	unpack ${A}
	# The zip contains dist/todoist-wrapper-linux-x64/
	mv "${WORKDIR}/dist/todoist-wrapper-linux-x64" "${S}" || die
}

src_install() {
	insinto /opt/todoist-wrapper
	doins -r .

	fperms +x /opt/todoist-wrapper/todoist-wrapper
	fperms +x /opt/todoist-wrapper/chrome_crashpad_handler
	fperms 4755 /opt/todoist-wrapper/chrome-sandbox

	dosym /opt/todoist-wrapper/todoist-wrapper /usr/bin/todoist-wrapper
}
