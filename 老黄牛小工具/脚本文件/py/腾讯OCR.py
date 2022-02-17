import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
listarr=lilyfun.readjson()
img1=listarr['文件绝对路径']
img2=""
secretId=listarr['QQ_SecretId']
secretKey=listarr['QQ_SECRET_KEY']
#fv=firstval(listarr)
print(img1 +"--"+ secretId+"--"+secretKey)
#----------------2.数据提交并返回数组-------------------

'''
    客户端：https://console.cloud.tencent.com/api/explorer?Product=ocr&Version=2018-11-19&Action=GeneralBasicOCR&SignVersion=
'''
from tencentcloud.common import credential
from tencentcloud.common.profile.client_profile import ClientProfile
from tencentcloud.common.profile.http_profile import HttpProfile
from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException
from tencentcloud.ocr.v20181119 import ocr_client, models

import base64

try:
    cred = credential.Credential(secretId, secretKey)
    httpProfile = HttpProfile()
    httpProfile.endpoint = "ocr.tencentcloudapi.com"

    clientProfile = ClientProfile()
    clientProfile.httpProfile = httpProfile
    client = ocr_client.OcrClient(cred, "ap-guangzhou", clientProfile)
    #img1=r"C:\Users\Administrator\Desktop\536.pdf"
    
    image_path = img1

    with open(image_path, 'rb') as f:  # 以二进制读取本地图片
        data = f.read()
        encodestr = str(base64.b64encode(data), 'utf-8')  # base64编码图片

    req = models.GeneralBasicOCRRequest()
    params = '{"LanguageType":"auto"}'
    req.from_json_string(params)
    req.ImageBase64 = encodestr
    # req.ImageUrl="https://mc.qcloudimg.com/static/img/6d4f1676deba26377d4303a462ca5074/image.png"
    resp = client.GeneralBasicOCR(req)
    print(resp.to_json_string())
    txt=""
    for text in resp.TextDetections: # 输出文字
        txt=text.DetectedText+"\n"+txt

    print(txt)

except TencentCloudSDKException as err:
    print(err)

arr2save={}
arr2save['腾讯OCR结果']=txt
#----------------3.数据写入json文件-------------------
lilyfun.savearr2json(arr2save,"key")
