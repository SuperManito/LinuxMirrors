## 执行命令

### 国内使用（默认）

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh)
```

### 海外使用

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh) --abroad
```
> 通过 `--abroad` 命令选项来使用海外软件源

### 国内教育网使用

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh) --edu
```
> 通过 `--edu` 命令选项来使用中国教育单位软件源

## 注意事项

- 完整复制上面的命令到终端按回车键即可执行，若无法安装 `curl` 软件包可复制源码到本地后通过 `bash` 手动执行  
- 为了适配所有环境，需要使用 `Root` 用户执行脚本，切换命令为 `su root`，如遇报错请查看常见问题与帮助  
- 如果您使用的环境没有安装或不支持简体中文环境，请通过 `SSH客户端工具` 使用，否则将无法正确选择交互内容  
- 执行脚本过程中会自动备份原有源无需手动备份，期间会在终端输出多个主观选择交互内容，可按回车键快速确定  
- 脚本支持在原有源配置错误或者不存在的情况下使用，并且可以重复使用；脚本变更的软件源默认使用 `HTTP` 协议

??? quote "原始执行脚本方法"

    ``` bash
    bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)
    ```
