# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg
MY_PN="listen1"
DESCRIPTION="one for all free music in china (Windows, Mac, Linux desktop)"
HOMEPAGE="https://github.com/listen1/listen1_desktop"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/listen1_${PV}_linux_amd64.deb -> ${MY_PN}-${PV}.deb"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="x11-libs/gtk+:3[cups]
	x11-libs/libXScrnSaver
	dev-libs/nss
	app-crypt/p11-kit
	dev-libs/libappindicator:3
	app-accessibility/at-spi2-core[X]
	app-crypt/libsecret
	x11-libs/libnotify
"
DEPEND=""
BDEPEND=""
S="${WORKDIR}"
src_install() {
	insinto /opt
	doins -r opt/*
	fperms +x /opt/${MY_PN^}/${MY_PN}
	dosym -r /opt/${MY_PN^}/${MY_PN} /usr/bin/${MY_PN}
	gzip -d usr/share/doc/${MY_PN}/*.gz || die
	dodoc usr/share/doc/${MY_PN}/*
	doicon -s 512 usr/share/icons/hicolor/512x512/apps/${MY_PN}.png
	domenu usr/share/applications/${MY_PN}.desktop
}
