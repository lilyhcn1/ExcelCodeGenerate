;��Ⱥ���������ӡ���һ��Ҫ������D:\�ϻ�ţС����\�����ļ�\myconf.ini

;�����ļ���������
Loop %0%{  ; ��ȡ���εĳ��ļ���
    GivenPath := %A_Index%  ; ��ȡ��һ�������в���.
    Loop %GivenPath%, 1
        LongPath = %A_LoopFileLongPath%
}

msgbox, %LongPath%
