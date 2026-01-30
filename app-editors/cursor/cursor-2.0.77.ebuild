# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The AI Code Editor - Cursor AppImage"
HOMEPAGE="https://cursor.sh"
SRC_URI="https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.0 -> cursor-${PV}.AppImage"

LICENSE="proprietary"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

DEPEND="
	sys-fs/fuse:0
"

RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/cursor-${PV}.AppImage" "${S}/cursor.AppImage" || die
}

src_install() {
	dodir /opt/cursor

	cp "${S}/cursor.AppImage" "${D}/opt/cursor/" || die "Failed to copy AppImage"

	fperms +x /opt/cursor/cursor.AppImage

	dosym /opt/cursor/cursor.AppImage /usr/bin/cursor

	# Create desktop entry
	dodir /usr/share/applications
	cat > "${D}/usr/share/applications/cursor.desktop" <<-DESKTOP
	[Desktop Entry]
	Name=Cursor
	Comment=The AI Code Editor
	Exec=/opt/cursor/cursor.AppImage --no-sandbox %F
	Icon=cursor
	Type=Application
	Categories=Development;IDE;TextEditor;
	MimeType=text/plain;
	StartupNotify=true
	DESKTOP
}
