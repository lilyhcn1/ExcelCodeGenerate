#Include %A_ScriptDir%\lib\JSON.ahk
#Include %A_ScriptDir%\lib\WinHttp.ahk
#Include %A_ScriptDir%\lib\base64.ahk

path := "D:\老黄牛小工具\ExcelQuery\temp\temp.json"
FileRead, OutputVar, %path%
json64 := b64Encode(OutputVar)



postdata := {"json64" : "22222222"}
URL:="http://192.168.7.38:8000/baidukd"
JSONPOST(URL,,postdata)
TrayTip,,% "发送完成"
JSONPOST(url, Encoding = "utf-8",postData=""){ ;网址，编码, post JSON数据
    hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
    Try
    {
        hObject.Open("POST",url,False)
        hObject.SetRequestHeader("Content-Type", "application/json")
        hObject.Send(postData)
    }
    catch e
        return -1
 
    if (Encoding && hObject.ResponseBody)
    {
        oADO := ComObjCreate("adodb.stream")
        oADO.Type := 1
        oADO.Mode := 3
        oADO.Open()
        oADO.Write(hObject.ResponseBody)
        oADO.Position := 0
        oADO.Type := 2
        oADO.Charset := Encoding
        return oADO.ReadText(), oADO.Close()
    }
    return hObject.ResponseText
}