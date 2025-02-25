#!/bin/bash

# 找到所有的.deb文件，并遍历它们
find . -type f -name "*.deb" | while read file; do
    # 使用basename获取不带路径的文件名
    filename=$(basename "$file")
    # 使用sed替换文件名中的_iphoneos-arm64为空白
    newname=$(echo "$filename" | sed 's/_iphoneos-arm64//g')
    # 获取文件所在的目录
    dir=$(dirname "$file")
    # 重命名文件
    mv "$dir/$filename" "$dir/$newname"
done

echo "替换完成。"
