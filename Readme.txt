GKD计系操作系统实验课用脚本

do.sh:脚本本体。目前仅支持-q和-g和-h三种输入选项。
gdb_settings:使用gdb调试时的预输入设置。默认导入symbols，设置架构及远程端口。可以根据需要自行添加（例如每次调试都需要在init_pcb函数处打断点，就在本文件中加入一行"b init_pcb"）。

运行方法：将gdb_settings文件和do.sh文件拷贝到start_code目录下，输入"bash do.sh"即可看到使用说明。附如下：

This is a script for UCAS's OS projects. USAGE:

    bash do.sh [option]

Options:

    -q:     Test the image in QEMU of Loongson.
            (Make sure there has been a visual "disk" file under "~/QEMULoongson/".)
    -g:     Connect GDB with symbol-file under arch mips.
            (The fucking annoying and useless version info will not be print.)
    -b:     Load the image to the BOARD and run.(DEBUGGING)
            (NOT RECOMMANDED. Connections with both SDcard and BOARD are required.)
    -h:     Print this message.

Report bugs to "<cacaogattoxy@gmail.com>", although the author seldom check his mailbox.XD
