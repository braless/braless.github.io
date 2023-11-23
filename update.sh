#!/bin/sh

#发送通知..

# 检查是否传递了文件内容参数



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



