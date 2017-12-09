#!/usr/bin/python2.7
#coding=utf8

#time 2017年09月21日
#

import httplib
import json
import md5
import sys
import urllib
import random

appid = '20170911000081984'
secretKey = 'OXF8sQsRUBMat16QUE4R'

 
httpClient = None
myurl = '/api/trans/vip/translate'

#check translation mode: chinese to English or e - c
if 1 == len(sys.argv):
    fromLang = 'en'
    toLang = 'zh'
elif 2 == len(sys.argv):
    if sys.argv[1] in ('ce', 'ec'):
        if sys.argv[1] == 'ce':
            fromLang = 'zh'
            toLang = 'en'
        else:#default is en to zh
            fromLang = 'en'
            toLang = 'zh'
    else:#parameters is illegal
        raise TypeError('parameters is illegal')
else:#too many parameters
    raise TypeError('too many parameters')

salt = random.randint(32768, 65536)

print 'Welcom to use Peach-Translation'

while True:
    try:
        q = raw_input("\n")
    except KeyboardInterrupt:
        print '\nThanks for using'
        sys.exit(0)

    sign = appid+q+str(salt)+secretKey
    m1 = md5.new()
    m1.update(sign)
    sign = m1.hexdigest()

    myurl = myurl+'?appid='+appid+'&q='+urllib.quote(q)+'&from='+fromLang+'&to='+toLang+'&salt='+str(salt)+'&sign='+sign

    try:
        httpClient = httplib.HTTPConnection('api.fanyi.baidu.com')
        httpClient.request('GET', myurl)
     
        #response是HTTPResponse对象
        response = httpClient.getresponse()
        result = json.loads(response.read())
        print type(result), result
        answer = result['trans_result'][0]['dst']
        #print 'answer is ', type(answer), answer
        #print 'result is:   ', answer
        print answer

        #print response.read()
    except Exception, e:
        print e
    finally:
        if httpClient:
            httpClient.close()
