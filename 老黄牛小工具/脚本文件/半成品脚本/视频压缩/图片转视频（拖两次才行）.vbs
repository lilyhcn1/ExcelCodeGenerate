dim width,height,t,n,str,ffmpegurl
width=1920   '宽
height=1080   '高
t=5   '视频播放间隔
str=""
ffmpegurl="http://vps0.upsir.com/lilypub/ffmpeg.exe"

function Download(url,target)
  Const adTypeBinary = 1
  Const adSaveCreateOverWrite = 2
  Dim http,ado
  Set http = CreateObject("Msxml2.ServerXMLHTTP")
  http.open "GET",url,False
  http.send
  Set ado = createobject("Adodb.Stream")
  ado.Type = adTypeBinary
  ado.Open
  ado.Write http.responseBody
  ado.SaveToFile target
  ado.Close
End function

Set ws=WScript.CreateObject("wscript.shell")
tpath = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path &"\"
ws.currentdirectory=tpath
rem Download(ffmpegurl,tpath & "ffmpeg.exe")

Set oArgs = WScript.Arguments
rem filepath=WScript.Arguments(0)


n=1
for each filepathtemp in WScript.Arguments
  runstr=tpath & "ffmpeg -ss 0 -t " & t &" -f lavfi -i color=c=0x000000:s=" & width & "x" & height & ":r=25  -i " & filepathtemp &" -filter_complex  ""[1:v]scale=" & width & ":" & height & "[v1];[0:v][v1]overlay=0:0[outv]""  -map [outv] -c:v libx264 " & n & ".ts -y"
rem msgbox(runstr)
  ws.Run runstr,True
  str=str & n & ".ts|"
  rem msgbox(str)
  n=n+1
next


str = left(str, len(str)-1)
runstr=tpath & "ffmpeg -i "& """concat:"& str&""" -c copy -bsf:a aac_adtstoasc -movflags +faststart output.mp4"
rem msgbox(runstr)
ws.Run runstr,True


