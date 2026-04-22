FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://after-seatd.conf"

do_install:append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -Dm644 ${WORKDIR}/after-seatd.conf \
            ${D}${systemd_system_unitdir}/emptty.service.d/after-seatd.conf
    fi
}

FILES:${PN} += "${systemd_system_unitdir}/emptty.service.d/after-seatd.conf"
