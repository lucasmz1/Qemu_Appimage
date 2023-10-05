# Qemu_Appimage

This is a Prove of the concept that is possible to run a virtual machine from an Appimage.
What is the goal?
To run QEMU a virtual machine emulator from this cantrainer.

which architectures are possible to run ussing this appimage? almost all of then which is supported by QEMU.
In this repository you may find a text file with examples for ussing This QEMU AppImage, of course it's all in portuguese, but no need worries... those commands are the same for every single use o QEMU.
if you had doubts about the use you can find me in Telegram: @lucasmzainote21.

useful commands!

this one bellow creat an hard drive

./QEMU-x86_64.AppImage qemu-img create -f qcow2 windows10.qcow2 30G

this other example boot the iso file

./QEMU-x86_64.AppImage qemu-system-x86_64 -enable-kvm -cpu host -smp cores=2 -m 4G -name 'Manjaro' -boot d -hda ~/Documentos/Manjaro.qcow2 -cdrom ~/Documentos/manjaro-gnome-21.3.7-220816-linux515.iso
