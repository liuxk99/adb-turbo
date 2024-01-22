#!/bin/bash
# 检查参数个数，如果没有FILE参数就退出
if [ $# -eq 0 ]; then
    echo "Usage: $0 <FILENAME>"
    exit 1
fi

# 保存文件名为第一个参数
FILENAME=$1
adb shell screencap -p /sdcard/$FILENAME
adb pull /sdcard/$FILENAME
adb shell rm /sdcard/$FILENAME


