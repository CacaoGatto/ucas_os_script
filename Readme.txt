GKD计系操作系统实验课用脚本（MIPS框架）

2019.11.12更新：
①增加了编译错误时终止脚本运行的设置，防止后续操作全部木大
②不需要额外借助gdb配置文件，脚本会自动生成和清除
③修改脚本名为pass.sh，让你的每次运行都能获得祈祷一般的玄学加成
④加入-c选项，执行后会在~/目录下生成连接向start_code的脚本，且自带sudo mount...指令，重启虚拟机/shell重连后不再需要手动完成共享文件夹的挂载
⑤优化了部分变量调用，方便自行调整配置


运行方法：
将pass.sh文件拷贝到start_code目录下，输入"bash pass.sh"即可看到使用说明。脚本也支持自定义配置，包括：
·源码第4行用户密码password，默认为123456，如果有不同请自行修改
·源码第6~7行GDB启动预配置setting，如果有其他固定需求可以自行添加
·源码第9行QEMU目录qemu_path，默认为~/QEMULoongson，如果有不同请自行修改

另，使用说明附如下：

This is a script for UCAS's OS projects. USAGE:

    bash pass.sh [option]

Options:

    -q:     Test the image in QEMU of Loongson.
            (Make sure there has been a visual "disk" file under "~/QEMULoongson/".)
    -g:     Connect GDB with symbol-file under arch mips.
            (The fucking annoying and useless version info will not be printed.)
    -c:     Create "pass.sh" under "~/".
            (Bash it directly. No need inputting "sudo mount..." after reconnection.)
    -b:     Load the image to the SDcard.
    -h:     Print this message.

Report bugs to "<cacaogattoxy@gmail.com>", although the author seldom checks his mailbox.XD
