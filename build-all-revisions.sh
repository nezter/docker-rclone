#!/bin/bash

for i in {96..99}; do
    export rclone_ver=0.${i}
    echo "Building Rclone version ${rclone_ver}"
    ./build-local.sh
done

for i in {00..46}; do
    case ${i} in
        43)
            export rclone_ver=1.${i}.1
            ;;
        47)
            export rclone_ver=1.${i}.0
            ;;
        48)
            export rclone_ver=1.${i}.0
            ;;
        49)
            export rclone_ver=1.${i}.0
            ;;
        *)
            export rclone_ver=1.${i}
            ;;
    esac
    echo "Building Rclone version ${rclone_ver}"
    ./build-local.sh
done
