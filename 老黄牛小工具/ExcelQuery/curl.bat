curl -X POST http://192.168.7.38:5000/postname -F 'upfile=temp.txt'
curl http://192.168.7.38:5000/postname -d "name=value1&param2=value2" -F 'upfile=temp.txt'
pause