FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://seatd.service"

inherit systemd

SYSTEMD_SERVICE:${PN} = "seatd.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_install:append() {
    if [ "${VIRTUAL-RUNTIME_init_manager}" = "systemd" ]; then
        install -Dm644 ${WORKDIR}/seatd.service \
            ${D}${systemd_system_unitdir}/seatd.service
    fi
}

FILES:${PN} += "${systemd_system_unitdir}/seatd.service"
