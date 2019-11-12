#!/bin/bash
set -e

usage="
This is a script for UCAS's OS projects. USAGE:

    bash do.sh [option]

Options:

    -q:     Test the image in QEMU of Loongson.
            (Make sure there has been a visual \"disk\" file under \"~/QEMULoongson/\".)
    -g:     Connect GDB with symbol-file under arch mips.
            (The fucking annoying and useless version info will not be print.)
    -b:     Load the image to the BOARD and run.(DEBUGGING)
            (NOT RECOMMANDED. Connections with both SDcard and BOARD are required.)

Report bugs to \"<cacaogattoxy@gmail.com>\", although the author seldom check mails.XD
"
guide="Use \`bash do.sh -h' for a complete list of options."
qemu_path=~/QEMULoongson

if [ ! $# == 1 ] ; then
    echo -e "$usage"
    exit
fi
if [ "$1" = "-q" ] ; then
    make clean
    make all
    cp image ~/QEMULoongson
    cd ~/QEMULoongson
    dd if=image of=disk conv=notrunc
    sh run_pmon.sh
elif [ "$1" = "-b" ] ; then
    make clean
    make all
    make floppy
    sudo minicom
elif [ "$1" = "-g" ] ; then
    echo -e "set arch mips\ntarget remote localhost:50010\n\n" > gdb_settings
    gdb-multiarch -x gdb_settings --symbols=main --quiet
    rm -f gdb_settings
elif [ "$1" = "-h" ] ; then
    echo -e "$usage"
else
    echo -e "Unrecognized option '$1'."
    echo -e "$guide"
fi
