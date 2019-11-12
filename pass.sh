#!/bin/bash
set -e

password="123456"
setting="
set arch mips
target remote localhost:50010
"
qemu_path=~/QEMULoongson
usage="
This is a script for UCAS's OS projects. USAGE:

    bash pass.sh [option]

Options:

    -q:     Test the image in QEMU of Loongson.
            (Make sure there has been a visual \"disk\" file under \"~/QEMULoongson/\".)
    -g:     Connect GDB with symbol-file under arch mips.
            (The fucking annoying and useless version info will not be printed.)
    -c:     Create \"pass.sh\" under \"~/\".
            (Bash it directly. No need inputting \"sudo mount...\" after reconnection.)
    -b:     Load the image to the SDcard.
    -h:     Print this message.

Report bugs to \"<cacaogattoxy@gmail.com>\", although the author seldom checks his mailbox.XD
"
workpath=$(cd $(dirname $0); pwd)
remote="
#!/bin/bash
set -e

echo $password | sudo -S mount -t vboxsf share /mnt/shared
echo
cd $workpath
bash pass.sh \$1
"
guide="Use \`bash pass.sh -h' for a complete list of options."

if [ ! $# == 1 ] ; then
    echo -e "$usage"
    exit
fi
if [ "$1" = "-q" ] ; then
    make clean
    make all
    cp image "$qemu_path"
    cd "$qemu_path"
    dd if=image of=disk conv=notrunc
    sh run_pmon.sh
elif [ "$1" = "-b" ] ; then
    make clean
    make all
    make floppy
elif [ "$1" = "-g" ] ; then
    echo -e "$setting" > gdb_settings
    gdb-multiarch -x gdb_settings --symbols=main --quiet
    rm -f gdb_settings
elif [ "$1" = "-c" ] ; then
    echo "$password" | sudo -S echo -e "$remote" > ~/pass.sh
    echo
elif [ "$1" = "-h" ] ; then
    echo -e "$usage"
else
    echo -e "Unrecognized option '$1'."
    echo -e "$guide"
fi
