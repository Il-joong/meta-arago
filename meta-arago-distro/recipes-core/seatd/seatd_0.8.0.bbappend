FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://video-group.conf"

do_install:append() {
    if [ "${VIRTUAL-RUNTIME_init_manager}" = "systemd" ]; then
        install -Dm644 ${WORKDIR}/video-group.conf \
            ${D}${systemd_system_unitdir}/seatd.service.d/video-group.conf
    fi
}

FILES:${PN} += "${systemd_system_unitdir}/seatd.service.d/video-group.conf"
