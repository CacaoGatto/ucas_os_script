GKD��ϵ����ϵͳʵ����ýű�

do.sh:�ű����塣Ŀǰ��֧��-q��-g��-h��������ѡ�
gdb_settings:ʹ��gdb����ʱ��Ԥ�������á�Ĭ�ϵ���symbols�����üܹ���Զ�̶˿ڡ����Ը�����Ҫ������ӣ�����ÿ�ε��Զ���Ҫ��init_pcb��������ϵ㣬���ڱ��ļ��м���һ��"b init_pcb"����

���з�������gdb_settings�ļ���do.sh�ļ�������start_codeĿ¼�£�����"bash do.sh"���ɿ���ʹ��˵���������£�

This is a script for UCAS's OS projects. USAGE:

    bash do.sh [option]

Options:

    -q:     Test the image in QEMU of Loongson.
            (Make sure there has been a visual \"disk\" file under \"~/QEMULoongson/\".)
    -g:     Connect GDB with symbol-file under arch mips.
            (The fucking annoying and useless version info will not be print.)
    -b:     Load the image to the BOARD and run.(DEBUGGING)
            (NOT RECOMMANDED. Connections with both SDcard and BOARD are required.)
    -h:     Print this message.

Report bugs to \"<cacaogattoxy@gmail.com>\", although the author seldom check his mailbox.XD