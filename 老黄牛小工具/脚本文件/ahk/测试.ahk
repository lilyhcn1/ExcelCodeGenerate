#Include %A_ScriptDir%\lib\JSON.ahk
#Include %A_ScriptDir%\lib\base64.ahk

;MsgBox % b64Encode("123456")
;MsgBox % b64Decode("VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZw==")


path := "D:\老黄牛小工具\ExcelQuery\temp\temp.json"
FileRead, OutputVar, %path%
msgbox % OutputVar
MsgBox % b64Encode(OutputVar)