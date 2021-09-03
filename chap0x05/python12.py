import base64
from Crypto.Cipher import AES
# 密钥（key）, 密斯偏移量（iv） CBC模式加密
 
def AES_Encrypt(key, data):
    vi = '0102030405060708'  #密钥偏移量
    pad = lambda s: s + (16 - len(s)%16) * chr(16 - len(s)%16)  #定义一个函数，这个函数的名字pad，这个函数需要一个参数，也就是s。
    data = pad(data)  #因为CBC模式AES加密需要满足加密数据长度是密钥长度的整数倍，所以如果长度不是整数倍，要加数据
    #下面两行就调用函数完成了加密
    cipher = AES.new(key.encode('utf8'), AES.MODE_CBC, vi.encode('utf8'))
    # 加密后得到的是bytes类型的数据
    encryptedbytes = cipher.encrypt(data.encode('utf8'))
    # 使用Base64进行编码,返回byte字符串
    encodestrs = base64.b64encode(encryptedbytes)
    # 对byte字符串按utf-8进行解码
    enctext = encodestrs.decode('utf8')
    return enctext
 
 
def AES_Decrypt(key, data):   #解密过程也就是加密过程的逆过程
    vi = '0102030405060708'        #密钥偏移量
    #转成byte字符串
    data = data.encode('utf8')
    # 使用base64解码，将加密数据转换位bytes类型数据
    encodebytes = base64.decodebytes(data)
    #下面两行代码对数据解密操作
    cipher = AES.new(key.encode('utf8'), AES.MODE_CBC, vi.encode('utf8'))
    text_decrypted = cipher.decrypt(encodebytes)
    #因为CBC模式AES加密需要满足加密数据长度是密钥长度的整数倍，所以数据后面可能有不需要的后来添加的数据，所以我们就去掉
    #因为添加后缀的时候按照“16 - len(s)%16”，那么后面那个字符的码值也就是原串原来长度差了多少是16整数倍
    unpad = lambda s: s[0:-s[-1]]
    text_decrypted = unpad(text_decrypted)
    text_decrypted = text_decrypted.decode('utf8')
    return text_decrypted
 
 
key = '0CoJUm6Qyw8W8jud'
data = 'sdadsdsdsfd'
AES_Encrypt(key, data)
enctext = AES_Encrypt(key, data)
print(enctext)
text_decrypted = AES_Decrypt(key, enctext)
print(text_decrypted)
 
hBXLrMkpkBpDFsf9xSRGQQ==
sdadsdsdsfd