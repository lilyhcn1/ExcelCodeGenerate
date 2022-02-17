
import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
listarr=lilyfun.readjson()
txt1=listarr['待翻译文本']

#fv=firstval(listarr)
print(txt1)
#----------------2.数据提交并返回数组-------------------

JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'

import json

from tencentcloud.common import credential
from tencentcloud.common.profile.client_profile import ClientProfile
from tencentcloud.common.profile.http_profile import HttpProfile
from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException
from tencentcloud.tmt.v20180321 import tmt_client, models
try:
    cred = credential.Credential("AKIDGNGyShgRyHLAk6D6k8GBqGQKzOXS8dvz", "tYy94kDSRDl47wa1C8pQowoQmskNktnR")#腾讯云api密钥 https://console.cloud.tencent.com/cam/capi
    httpProfile = HttpProfile()
    httpProfile.endpoint = "tmt.tencentcloudapi.com" #接口网址

    clientProfile = ClientProfile()
    clientProfile.httpProfile = httpProfile
    client = tmt_client.TmtClient(cred, "ap-guangzhou", clientProfile) #接口地域

    req = models.TextTranslateRequest()
    params = {
        "SourceText": txt1,#待翻译文本
        "Source": "auto",#语种自动识别
        "Target": "en",#zh-简体中文 en-英语 ja-日语 ko-韩语
        "ProjectId": 0
    }
    req.from_json_string(json.dumps(params))

    resp = client.TextTranslate(req)
    print(resp.to_json_string())
    #将返回的resp转换为字符后通过json转为字典用于输出翻译结果
    resp=str(resp)
    import json
    user_info = resp
    user_dict = json.loads(user_info)
    print(user_dict)
except TencentCloudSDKException as err:
    print(err)


arr2save={}
arr2save['翻译结果']=user_dict['TargetText']
print(arr2save)
#----------------3.数据写入json文件-------------------
lilyfun.savearr2json(arr2save,"key")


