GKD计系操作系统实验课用脚本（MIPS框架）

2019.11.12更新：
①增加了编译错误时终止脚本运行的设置，防止后续操作全部木大
②不需要额外下载gdb配置文件，脚本会自动生成和清除
③修改脚本名为pass.sh，让你的每次运行都能获得祈祷一般的玄学加成



运行方法：将pass.sh文件拷贝到start_code目录下，输入"bash pass.sh"即可看到使用说明。附如下：

This is a script for UCAS's OS projects. USAGE:

    bash pass.sh [option]

Options:

    -q:     Test the image in QEMU of Loongson.
            (Make sure there has been a visual "disk" file under "~/QEMULoongson/".)
    -g:     Connect GDB with symbol-file under arch mips.
            (The fucking annoying and useless version info will not be printed.)
    -b:     Load the image to the BOARD and run.(DEBUGGING)
            (NOT RECOMMANDED. Connections with both SDcard and BOARD are required.)
    -h:     Print this message.

Report bugs to "<cacaogattoxy@gmail.com>", although the author seldom checks his mailbox.XD
