# 安装
sh ./install.sh

# 自动补全
## YouCompleteMe
集成所有补全、跳转 等一套功能，但是能使用的语言有限
安装：sh ./ycm_install.sh
安装前最好先阅读一遍这个脚本，里面有遇到错误的解决办法

## coc.nvim
这是基于lsp(language server protocol)，不懂的可以百度
1、它依赖nodejs环境
2、它需要一个language server来完成补全等功能，c++用的是clangd，其它语言自行下载对应的server
3、运行脚本 sh ./coc.sh 会同时安装nodejs、clangd

安装问题：
clangd 至少需要glibc(gnu libc) version >= 2.18
运行：clangd --version 如果没异常则满足 否则会说明glibc版本过低
解决办法：
sh ./glibc_install.sh   
中途会让输入用户密码
再输入clangd --version 看是否异常

使用方法：
进入vim，输入 :CocConfig
进入编辑一个文件 输入以下代码 注册language server
```json
{
"languageserver": {
    "clangd": {
      "command": "clangd",
      "rootPatterns": ["compile_flags.txt", "compile_commands.json"],
      "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"]
    }
  }
}
```

其它语言的注册参考: https://github.com/neoclide/coc.nvim/wiki/Language-servers

现在可以补全了 但是项目里面那么多散落的头文件 它怎么知道去哪找？
参考：https://clangd.llvm.org/installation.html#project-setup  里面的Project setup一节

需要我们先运行cmake bazel make来构建一遍项目，用特定工具跟踪编译过程 将所有用到的头文件生成一个compile_commands.json文件
就能让server知道去哪些地方找头文件

cmake 直接运行命令：
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1

make 用bear
bear安装：

bazel：

