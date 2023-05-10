---
hide:
  - feedback
---

## 执行命令

### 国内使用（默认）

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh)
```

### 海外使用

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh) --abroad # (1)!
```

1.  通过 `--abroad` 命令选项来使用海外软件源

### 国内教育网使用

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh) --edu # (1)!
```

1.  通过 `--edu` 命令选项来使用中国教育单位软件源

??? quote "原始执行脚本方法"

    ``` bash
    bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)
    ```

## 注意事项

:material-numeric-1:{style="color: #3CA7E5"} 需使用 `Root` 用户执行脚本

:   切换命令为 `su root`

:material-numeric-2:{style="color: #3CA7E5"} 建议使用 `SSH` 远程工具

:   如果你使用的系统终端界面不支持 `UTF-8` 编码那么将无法正常显示中文内容，导致无法正确选择交互内容。大部分系统都会自动开启该服务，否则请参考[启用方法](/use/help/#%E5%85%B3%E4%BA%8E%E5%BC%80%E5%90%AF-ssh-%E8%BF%9C%E7%A8%8B%E7%99%BB%E5%BD%95%E7%9A%84%E6%96%B9%E6%B3%95)

:material-numeric-3:{style="color: #3CA7E5"} 如果是首次在新系统上执行脚本

:   当前执行方式依赖 `curl` 指令来获取脚本内容并执行，所以需要先通过包管理工具来安装该软件包，否则会报错 `Command not found`，安装方法详见[常见问题](/use/help/#%E5%85%B3%E4%BA%8E%E6%8A%A5%E9%94%99-command-not-found)，若无法安装就复制[源码](https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)到本地新建`.sh`脚本，然后通过 `bash` 手动执行  

!!! note ":octicons-heart-fill-24:{ .heart style="color: red" } 如果您觉得这个项目不错对您有所帮助的话，方便在仓库右上角给颗 ⭐ 并分享给更多的朋友吗？"
