#Include %A_ScriptDir%\JSON.ahk
#Include %A_ScriptDir%\Class_bdocr.ahk
API_KEY:="PFCyfV2U9ahzeSzssxEen2RF"
SECRET_KEY:="sOIEY5DDadUF1GbE53DndEl9prRrZX2q"

;������ 1 �ӿ���û���� ��2 ��һ��ֵ���ضԲ���
; �������ҵ�����ĵ�һ��ֵ
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

; ������get��ʽ��ȡ����ֵ
geturlcontent(ByRef url){
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    whr.Open("Get", url, true)
    whr.Send()
    whr.WaitForResponse()
    r := whr.ResponseText
  return r
}



; ������get��ʽ��ȡ����ֵ
readtext(ByRef path){
FileRead, jsonstr, path
  return jsonstr
}


;��ȡ�ļ�
FileRead, jsonstr, d:\�ϻ�ţС����\ExcelQuery\temp\temp.json
parsed := JSON.Load(jsonstr)
fv := returnfirstvalue(parsed["contents"])
;msgbox % fv


;��ȡapi�Ľ��
ocr:=new bdocr(API_KEY, SECRET_KEY)
;ret:=ocr.GetOcr(A_ScriptDir "\3.png","accurate_basic")	; �߾���ʶ��
ret:=ocr.GetOcr("D:\�ϻ�ţС����\ExcelQuery\temp\temp.jpg","general_basic")							; ��ͨ����ʶ��




;����excel��Ҫ������
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


;������õ�����д���ı�
stringified := JSON.Dump(arr2,, 4)
;msgbox % arr2["w"]
FileDelete, d:\�ϻ�ţС����\ExcelQuery\temp\temp.json
FileAppend,%stringified%,d:\�ϻ�ţС����\ExcelQuery\temp\temp.json
;run,d:\�ϻ�ţС����\ExcelQuery\temp\temp.json

























