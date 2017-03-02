#!/bin/bash
export TARGET_DIR=/opt/mylinux
mount -v --bind /dev ${TARGET_DIR}/dev
mount -vt devpts devpts ${TARGET_DIR}/dev/pts
mount -vt tmpfs shm ${TARGET_DIR}/dev/shm
mount -vt proc proc ${TARGET_DIR}/proc
mount -vt sysfs sysfs ${TARGET_DIR}/sys
chroot "${TARGET_DIR}" /tools/bin/env -i \
 HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
 PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
 /tools/bin/bash --login +h


