# 日志转存
在实践中通常会使用`logcat -r -n`转存到硬盘。
```
/system/bin/logcat -b all -v threadtime -v printable -n 20 -r 5000 -f path-of-logcat.log
```
logcat -r -n是一个用于控制logcat输出文件的命令行参数。这个参数用于指定logcat输出文件的数量和大小。-r参数用于指定最大的输出文件大小，而-n参数用于指定最大的输出文件数量。当输出文件达到指定大小时，logcat会自动切换到下一个文件，直到达到指定的文件数量为止。
# 文件名规格
生成的文件名规格通常是以“logcat”为前缀，后面跟着一个数字序号，表示文件的顺序。例如，logcat输出文件的命名规则可能是logcat.log.1、logcat.log.2、logcat.log.3等等，以此类推。在较高版本的Android上，生成的文件名规格通常是以“logcat.log”为前缀，后面跟着一个两位数的数字序号，表示文件的顺序。例如，logcat输出文件的命名规则可能是logcat.log.01、logcat.log.02、logcat.log.03, ..., logcat.log.11等等，以此类推。
ls命令来列举10个及以上文件的顺序就和生成文件的顺序不同了。期望的顺序如下：
## 按生成时间顺序
```
$ echo `logcat-r-n.count.sh `
logcat.log.11 logcat.log.10 logcat.log.9 logcat.log.8 logcat.log.7 logcat.log.6 logcat.log.5 logcat.log.4 logcat.log.3 logcat.log.2 logcat.log.1 logcat.log
```
## 按照文件名逆序
```
$ echo `ls -r`
logcat.log.9 logcat.log.8 logcat.log.7 logcat.log.6 logcat.log.5 logcat.log.4 logcat.log.3 logcat.log.2 logcat.log.11 logcat.log.10 logcat.log.1 logcat.log
```
比如：`logcat.log.11 logcat.log.10 logcat.log.1`中间显然间隔了好一些文件。
# 小结
该脚本用来按生成文件的时间升序输出文件名。结合`cat`命令可以把文件内容拼接到一个文件中，比如下述的命令：
```
$ cat `logcat-r-n.count.sh` >../Log.2.log
```