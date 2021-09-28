;打开群，分享链接。请一定要先配置D:\老黄牛小工具\配置文件\myconf.ini

;复制文件到剪贴板
Loop %0%{  ; 获取传参的长文件名
    GivenPath := %A_Index%  ; 获取下一个命令行参数.
    Loop %GivenPath%, 1
        LongPath = %A_LoopFileLongPath%
}

msgbox, %LongPath%
