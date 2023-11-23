#!/bin/sh

#发送通知..

# 检查是否传递了文件内容参数

file_content="$1"
TOKEN="6222369978:AAE7hkZEJhuU0KFgzdLziX-Y-GN_mn4Ucxk"	#TG机器人token
chat_ID=275642085		#用户ID或频道、群ID
message_text="越狱软件源检测到文件:$file_content ,正在推送到Github"		#要发送的信息
MODE='Markdown'		#解析模式，可选HTML或Markdown
URL="https://tg.bilin.eu.org/bot${TOKEN}/sendMessage"		#api接口
#测试1：终端有日志
#curl -s -X POST $URL -d chat_id=${chat_ID}  -d parse_mode=${MODE} -d text="${message_text}"  	
#测试2：终端无日志
curl -s -o /dev/null -X POST $URL -d chat_id=${chat_ID} -d text="${message_text}"  


#压缩打包
cd /APP-JD/braless.github.io/
echo "开始生成Pakages..."
python3 dpkg-scanpackages.py -m debs > Packages
echo "生成Packages完成！"

echo "进入项目目录..."
echo "开始压缩Packages..."
bzip2  -f -k  Packages
echo "压缩Packages完成！"
git add --all .
git commit -m "update repo"
git push
echo "上传完成！！"



