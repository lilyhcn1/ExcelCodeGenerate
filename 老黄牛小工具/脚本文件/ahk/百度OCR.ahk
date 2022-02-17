#Include %A_ScriptDir%\JSON.ahk
#Include %A_ScriptDir%\Class_bdocr.ahk
API_KEY:="PFCyfV2U9ahzeSzssxEen2RF"
SECRET_KEY:="sOIEY5DDadUF1GbE53DndEl9prRrZX2q"

;错误检查 1 接口有没申请 ，2 第一个值返回对不对
; 函数：找到数组的第一个值
returnfirstvalue(ByRef arr){
  For index, value in arr{
      ;MsgBox % "Item " index " is '" arr[index] "'"
      if(arr["ask"] <> ""){
        fv := arr["ask"]
      }else{
        fv := arr[index]
      }
      break
  }
  return fv
}

; 函数：get方式获取返回值
geturlcontent(ByRef url){
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    whr.Open("Get", url, true)
    whr.Send()
    whr.WaitForResponse()
    r := whr.ResponseText
  return r
}



; 函数：get方式获取返回值
readtext(ByRef path){
FileRead, jsonstr, path
  return jsonstr
}


;读取文件
FileRead, jsonstr, d:\老黄牛小工具\ExcelQuery\temp\temp.json
parsed := JSON.Load(jsonstr)
fv := returnfirstvalue(parsed["contents"])
;msgbox % fv


;读取api的结果
ocr:=new bdocr(API_KEY, SECRET_KEY)
;ret:=ocr.GetOcr(A_ScriptDir "\3.png","accurate_basic")	; 高精度识别
ret:=ocr.GetOcr("D:\老黄牛小工具\ExcelQuery\temp\temp.jpg","general_basic")							; 普通精度识别




;构造excel需要的数组
arr2 := []
temparr :=[]
;newr := returnfirstvalue(r["pois"]["0"])
newr :=ret

arr2["script"] := "ahk"
arr2["w"] := "all"

for k,v in JSON.Load(ret).words_result{
  temparr[k] := v.words
}
arr2["content"] := temparr


;将构造好的数组写入文本
stringified := JSON.Dump(arr2,, 4)
;msgbox % arr2["w"]
FileDelete, d:\老黄牛小工具\ExcelQuery\temp\temp.json
FileAppend,%stringified%,d:\老黄牛小工具\ExcelQuery\temp\temp.json
;run,d:\老黄牛小工具\ExcelQuery\temp\temp.json

























