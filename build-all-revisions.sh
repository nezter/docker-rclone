#!/bin/bash

for i in {34..46}; do
    case ${i} in
        43)
            rclone_ver=1.${i}.1
            ;;
        47)
            rclone_ver=1.${i}.0
            ;;
        48)
            rclone_ver=1.${i}.0
            ;;
        49)
            rclone_ver=1.${i}.0
            ;;
        *)
            rclone_ver=1.${i}
            ;;
    esac
    echo "Building Rclone version ${rclone_ver}"
    rclone_ver=${rclone_ver} ./build-local.sh
done
