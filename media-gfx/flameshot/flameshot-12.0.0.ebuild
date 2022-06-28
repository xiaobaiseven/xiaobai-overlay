# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake xdg

DESCRIPTION="Powerful yet simple to use screenshot software"
HOMEPAGE="https://flameshot.org https://github.com/flameshot-org/flameshot"
SRC_URI="https://github.com/flameshot-org/flameshot/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 Free-Art-1.3 GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	=dev-qt/qtsingleapplication-2.6*[qt5(+),X]
	dev-qt/qtwidgets:5
	dev-qt/qtsvg:5
	dev-qt/qtnetwork:5
	dev-qt/qtdbus:5
	sys-apps/dbus
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"
src_prepare() {
	xdg_src_prepare
	cmake_src_prepare
	elog "Read https://github.com/lupoDharkael/flameshot#global for runtime configuration"
}
