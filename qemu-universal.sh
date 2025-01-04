#!/bin/bash
sudo apt-get install desktop-file-utils debootstrap schroot perl git wget xz-utils bubblewrap autoconf coreutils
wget -q "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage" -O appimagetool && chmod a+x appimagetool
wget -q -c "https://archive.archlinux.org/iso/2025.01.01/archlinux-bootstrap-x86_64.tar.zst"
mkdir arch
tar xf archlinux-bootstrap-x86_64.tar.zst -C ./arch/
# criar no github uma nova pasta parao AppRun e demais arquivos.
cp /etc/resolv.conf -t ${GITHUB_WORKSPACE}/arch/root.x86_64/etc/ && cp ${GITHUB_WORKSPACE}/files/mirrorlist -t ${GITHUB_WORKSPACE}/arch/root.x86_64/etc/pacman.d/ && cp ${GITHUB_WORKSPACE}/files/pacman.conf -t ${GITHUB_WORKSPACE}/arch/root.x86_64/etc/
cd ${GITHUB_WORKSPACE}
sudo chroot ./arch/root.x86_64/ /usr/bin/bash
pacman -Syyu
pacman -S qemu-full jack2 --noconfirm
pacman -Scc --noconfirm
exit
cp ${GITHUB_WORKSPACE}/files/AppRun ${GITHUB_WORKSPACE}/arch/ && cp ${GITHUB_WORKSPACE}/files/qemu.svg -t ${GITHUB_WORKSPACE}/arch/ && cp ${GITHUB_WORKSPACE}/files/qemu.desktop -t ${GITHUB_WORKSPACE}/arch/
mv ${GITHUB_WORKSPACE}/arch/root.x86_64/ ./root/
ARCH=x86_64 ./appimagetool -n ./arch/
