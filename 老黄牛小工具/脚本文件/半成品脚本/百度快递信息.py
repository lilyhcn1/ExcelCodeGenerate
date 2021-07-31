#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests

# 快递查询POST Python示例代码
if __name__ == '__main__':
    url = 'http://gwgp-65bmfhhrext.n.bdcloudapi.com/express/query'
    params = {}
    params['type'] = 'auto'
    params['number'] = '4315575396239'
    params['mobile'] = '13058826700'
    
    
    headers = {
        
        'Content-Type': 'application/json;charset=UTF-8',
        'X-Bce-Signature': 'AppCode/9234cad5d4bf4e4fa31c855587f25491'
    }
    r = requests.request("POST", url, params=params, headers=headers)
    print(r.content.decode('utf-8'))
