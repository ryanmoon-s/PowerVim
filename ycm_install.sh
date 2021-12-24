#########################################################################
# File Name:    final_install.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 二 12/21 11:29:57 2021
#########################################################################
#!/bin/bash

ycm_dir=".vim/plugged/YouCompleteMe"

if [[ ! -d $ycm_dir ]]; then
    echo "请先进入vim 运行:PlugInstall 下载YouCompleteMe"
else
    python3 $ycm_dir/install.py --clang-completer --system-libclang
    cp .ycm_extra_conf.py $ycm_dir
    echo "\n\n[不出意外的话已经安装成功了]"
    echo "\n\n[很有必要将~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py移到开发项目的根目录]\n\n"
fi

# tips:

# 遇到缺少的库去安装
# 如果商店安装的库版本不够新，去百度下载手动编译 (可能有vim cmake等)


# 可能会遇到错误提示（vim编辑界面提示Ycm server shutdown）：
# 按照指引打开日志发现：/lib64/libstdc++.so.6: version `GLIBCXX_3.4.26' not found
# 这是标准库过旧导致ycm编译错误，用下面的方法重新导入需要的lib库
#
# libstdc.so_.6.0.26.zip 下载：https://wwa.lanzoui.com/i8lnene
# unzip libstdc.so_.6.0.26.zip
# cp libstdc++.so.6.0.26 /usr/lib64
# ln -s libstdc++.so.6.0.20 libstdc++.so.6
#
