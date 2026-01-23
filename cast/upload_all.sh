#!/bin/bash

# 定义要上传的文件列表（按你的文件名顺序）
files=(
  00-euler.cast
  01-xiangshan.cast
  02-pi4.cast
  03-meles.cast
  04-duo.cast
  05-duo256.cast
  06-duos.cast
  07-pioneer.cast
  08-nano.cast
  09-canmv.cast
  10-pi3.cast
  11-f3.cast
  12-jupiter.cast
  13-musebook.cast
  14-musebox.cast
  15-musepipro.cast
  16-orange.cast
  17-vf2.cast
  18-mars.cast
  19-nezha.cast
  20-unmatched.cast
)

# 创建一个文件保存上传结果（链接）
result_file="upload_results.txt"
echo "文件名称 | 分享链接" > $result_file
echo "-------- | --------" >> $result_file

# 遍历文件并逐个上传
for file in "${files[@]}"; do
  if [ -f "$file" ]; then
    echo "正在上传 $file ..."
    # 执行上传命令，捕获输出中的链接
    upload_output=$(asciinema upload "$file" 2>&1)
    # 从输出中提取分享链接
    link=$(echo "$upload_output" | grep -o 'https://asciinema.org/a/[0-9a-zA-Z]*')
    # 保存结果到文件
    if [ -n "$link" ]; then
      echo "$file | $link" >> $result_file
      echo "$file 上传成功：$link"
    else
      echo "$file 上传失败，输出：$upload_output" >> $result_file
      echo "$file 上传失败！"
    fi
  else
    echo "$file 不存在，跳过..."
    echo "$file | 文件不存在" >> $result_file
  fi
  # 暂停1秒，避免请求过快
  sleep 1
done

echo "批量上传完成！结果已保存到 $result_file"

