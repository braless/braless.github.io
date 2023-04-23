#!/bin/sh
#echo("开始生成Pakages...")
python3 dpkg-scanpackages.py -m debs/ > Packages


#echo("生成Packages完成！")
#echo("开始压缩Packages...")

bzip2  -f -k  Packages
#echo("压缩Packages完成！")
git add .
git commit -m "update repo"
git push
