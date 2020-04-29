#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/etc/libnfc-nci.conf)
            sed -i 's|NFC_DEBUG_ENABLED=1|NFC_DEBUG_ENABLED=0|g' "${2}"
            ;;
        vendor/etc/libnfc-nxp-21619.conf)
            sed -i 's|LOGLEVEL=0x03|LOGLEVEL=0x01|g' "${2}"
            sed -i 's|NFC_DEBUG_ENABLED=1|NFC_DEBUG_ENABLED=0x00|g' "${2}"
            ;;
        vendor/etc/libnfc-nxp-2169B.conf)
            sed -i 's|LOGLEVEL=0x03|LOGLEVEL=0x01|g' "${2}"
            sed -i 's|NFC_DEBUG_ENABLED=1|NFC_DEBUG_ENABLED=0x00|g' "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=bitra
export DEVICE_COMMON=sm8250-common
export VENDOR=realme

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
