aa =msgbox("使用说明："& chr(13) & "1.将光标定位到要拆分的单元格上。"& chr(13) &"2.运行此VBS。"& chr(13) &"已知Bug:"& chr(13) &"1.空格列的筛选不正确；"& chr(13) &"2.结尾部分无法筛选。",vbOKCancel,"筛选另存" )

if aa <> 1 then
msgbox("退出")
WScript.Quit
end if 

