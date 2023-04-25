#!/bin/sh
echo "开始生成Pakages..."
python3 /APP-JD/braless.github.io/dpkg-scanpackages.py -m /APP-JD/braless.github.io/debs > /APP-JD/braless.github.io/Packages
echo "生成Packages完成！"

echo "进入项目目录..."
echo "开始压缩Packages..."
cd /APP-JD/braless.github.io/
bzip2  -f -k  Packages
echo "压缩Packages完成！"
git add --all .
git commit -m "update repo"
git push
echo "上传完成！！"
