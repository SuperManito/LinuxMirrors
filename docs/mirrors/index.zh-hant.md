---
hide:
  - navigation
  - toc
  - feedback
  - footer
search:
  exclude: true
---

???+ question "友情提示"

    本項目預設提供的軟體源列表主要服務位於中國大陸的用戶，因此對您來說該頁面上可能存在許多無用的資訊。作者沒有精力去採集和維護全世界的可用軟體源，所以可能需要透過命令選項自訂使用才能滿足您的實際需求，具體預設的國際軟體源詳見下方。

## 中國大陸 :flag-CN:

> 下方列表中的鏡像站均支援 `Debian` `Ubuntu` `CentOS` `openSUSE` `openEuler` 軟體源，列表根據單位性質、地理位置、名稱長度排序，與實際速度無關

<div id="mirrors-table"><p>正在載入表格 <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" style="vertical-align: -0.15rem"><g stroke="currentColor"><circle cx="12" cy="12" r="9.5" fill="none" stroke-linecap="round" stroke-width="3"><animate attributeName="stroke-dasharray" calcMode="spline" dur="1.5s" keySplines="0.42,0,0.58,1;0.42,0,0.58,1;0.42,0,0.58,1" keyTimes="0;0.475;0.95;1" repeatCount="indefinite" values="0 150;42 150;42 150;42 150"/><animate attributeName="stroke-dashoffset" calcMode="spline" dur="1.5s" keySplines="0.42,0,0.58,1;0.42,0,0.58,1;0.42,0,0.58,1" keyTimes="0;0.475;0.95;1" repeatCount="indefinite" values="0;-16;-59;-59"/></circle><animateTransform attributeName="transform" dur="2s" repeatCount="indefinite" type="rotate" values="0 12 12;360 12 12"/></g></svg></p></div>

???+ question "使用幫助"

    :supported: 支援 &nbsp;&nbsp; :unsupport: 不支援 &nbsp;&nbsp; :incompatible: 不相容，表示軟體源分支命名不符合腳本預設規則但可以透過命令選項來使用，關於具體用法範例和各作業系統所使用的預設分支名稱[详见此处](../use/index.md#指定软件源仓库)

    如果這裡沒有想使用的鏡像站那可以看看其它運行模式和命令選項。軟體源的速度區分刷新速度和下行速率，後者才是關鍵，具體請結合實際地理位置選擇嘗試，也可以透過[輔助工具網站](#工具網站)進行一些測試

    :material-thumb-up-outline: 使用建議：速度上推薦 `中科大`、`字节(火山引擎)`，地域相容性上推薦 `阿里云`、`腾讯云`，軟體源種類上推薦 `南京大学`、`中科院`，境外、海外或複雜網路環境下不建議使用 `清华(TUNA)` 等容易阻斷的鏡像站

??? note "中國大陸教育網（點擊展開查看）"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 北京大学 | [mirrors.pku.edu.cn](https://mirrors.pku.edu.cn "https://mirrors.pku.edu.cn") |
    | 北京交通大学 | [mirror.bjtu.edu.cn](https://mirror.bjtu.edu.cn "https://mirror.bjtu.edu.cn") |
    | 北京外国语大学 | [mirrors.bfsu.edu.cn](https://mirrors.bfsu.edu.cn "https://mirrors.bfsu.edu.cn") |
    | 北京邮电大学 | [mirror.bupt.edu.cn](https://mirror.bupt.edu.cn "https://mirror.bupt.edu.cn") |
    | 重庆大学 | [mirrors.cqu.edu.cn](https://mirrors.cqu.edu.cn "https://mirrors.cqu.edu.cn") |
    | 重庆邮电大学 | [mirrors.cqupt.edu.cn](https://mirrors.cqupt.edu.cn "https://mirrors.cqupt.edu.cn") |
    | 大连东软信息学院 | [mirrors.neusoft.edu.cn](https://mirrors.neusoft.edu.cn "https://mirrors.neusoft.edu.cn") |
    | 电子科技大学 | [mirrors.uestc.cn](https://mirrors.uestc.cn "https://mirrors.uestc.cn") |
    | 华南农业大学 | [mirrors.scau.edu.cn](https://mirrors.scau.edu.cn "https://mirrors.scau.edu.cn") |
    | 华中科技大学 | [mirrors.hust.edu.cn](https://mirrors.hust.edu.cn "https://mirrors.hust.edu.cn") |
    | 吉林大学 | [mirrors.jlu.edu.cn](https://mirrors.jlu.edu.cn "https://mirrors.jlu.edu.cn") |
    | 荆楚理工学院 | [mirrors.jcut.edu.cn](https://mirrors.jcut.edu.cn "https://mirrors.jcut.edu.cn") |
    | 江西理工大学 | [mirrors.jxust.edu.cn](https://mirrors.jxust.edu.cn "https://mirrors.jxust.edu.cn") |
    | 兰州大学 | [mirror.lzu.edu.cn](https://mirror.lzu.edu.cn "https://mirror.lzu.edu.cn") |
    | 南京大学 | [mirrors.nju.edu.cn](https://mirrors.nju.edu.cn "https://mirrors.nju.edu.cn") |
    | 南京工业大学 | [mirrors.njtech.edu.cn](https://mirrors.njtech.edu.cn "https://mirrors.njtech.edu.cn") |
    | 南京邮电大学 | [mirrors.njupt.edu.cn](https://mirrors.njupt.edu.cn "https://mirrors.njupt.edu.cn") |
    | 南方科技大学 | [mirrors.sustech.edu.cn](https://mirrors.sustech.edu.cn "https://mirrors.sustech.edu.cn") |
    | 南阳理工学院 | [mirror.nyist.edu.cn](https://mirror.nyist.edu.cn "https://mirror.nyist.edu.cn") |
    | 齐鲁工业大学 | [mirrors.qlu.edu.cn](https://mirrors.qlu.edu.cn "https://mirrors.qlu.edu.cn") |
    | 清华大学 | [mirrors.tuna.tsinghua.edu.cn](https://mirrors.tuna.tsinghua.edu.cn "https://mirrors.tuna.tsinghua.edu.cn") |
    | 山东大学 | [mirrors.sdu.edu.cn](https://mirrors.sdu.edu.cn "https://mirrors.sdu.edu.cn") |
    | 上海科技大学 | [mirrors.shanghaitech.edu.cn](https://mirrors.shanghaitech.edu.cn "https://mirrors.shanghaitech.edu.cn") |
    | 上海交通大学（思源） | [mirror.sjtu.edu.cn](https://mirror.sjtu.edu.cn "https://mirror.sjtu.edu.cn") |
    | 上海交通大学（致远） | [mirrors.sjtug.sjtu.edu.cn](https://mirrors.sjtug.sjtu.edu.cn "https://mirrors.sjtug.sjtu.edu.cn") |
    | 武昌首义学院 | [mirrors.wsyu.edu.cn](https://mirrors.wsyu.edu.cn "https://mirrors.wsyu.edu.cn") |
    | 西安交通大学 | [mirrors.xjtu.edu.cn](https://mirrors.xjtu.edu.cn "https://mirrors.xjtu.edu.cn") |
    | 西北农林科技大学 | [mirrors.nwafu.edu.cn](https://mirrors.nwafu.edu.cn "https://mirrors.nwafu.edu.cn") |
    | 浙江大学 | [mirrors.zju.edu.cn](https://mirrors.zju.edu.cn "https://mirrors.zju.edu.cn") |
    | 中国科学技术大学 | [mirrors.ustc.edu.cn](https://mirrors.ustc.edu.cn "https://mirrors.ustc.edu.cn") |

## 國際地區 :flag-world-map:

=== ":fontawesome-solid-earth-asia: 亞洲"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 亞洲 · xTom · 香港 :flag-HK: | [mirrors.xtom.hk](https://mirrors.xtom.hk "https://mirrors.xtom.hk") |
    | 亞洲 · 01Link · 香港 :flag-HK: | [mirror.01link.hk](https://mirror.01link.hk "https://mirror.01link.hk") |
    | 亞洲 · 新加坡國立大學(NUS) · 新加坡 :flag-SG: | [download.nus.edu.sg/mirror](https://download.nus.edu.sg "https://download.nus.edu.sg") |
    | 亞洲 · SG.GS · 新加坡 :flag-SG: | [mirror.sg.gs](https://mirror.sg.gs "https://mirror.sg.gs") |
    | 亞洲 · xTom · 新加坡 :flag-SG: | [mirrors.xtom.sg](https://mirrors.xtom.sg "https://mirrors.xtom.sg") |
    | 亞洲 · 自由軟體實驗室(NCHC) · 臺灣 :flag-TW: | [free.nchc.org.tw](https://free.nchc.org.tw "https://free.nchc.org.tw") |
    | 亞洲 · OSS Planet · 臺灣 :flag-TW: | [mirror.ossplanet.net](https://mirror.ossplanet.net "https://mirror.ossplanet.net") |
    | 亞洲 · 國立陽明交通大學 · 臺灣 :flag-TW: | [linux.cs.nctu.edu.tw](https://linux.cs.nctu.edu.tw "https://linux.cs.nctu.edu.tw") |
    | 亞洲 · 淡江大學 · 臺灣 :flag-TW: | [ftp.tku.edu.tw](https://ftp.tku.edu.tw "https://ftp.tku.edu.tw") |
    | 亞洲 · AniGil Linux Archive · 韓國 :flag-KR: | [mirror.anigil.com](https://mirror.anigil.com "https://mirror.anigil.com") |
    | 亞洲 · 工業網路安全中心(ICSCoE) · 日本 :flag-JP: | [ftp.udx.icscoe.jp/Linux](https://ftp.udx.icscoe.jp/Linux "https://ftp.udx.icscoe.jp/Linux") |
    | 亞洲 · 北陸先端科學技術大學院大學(JAIST) · 日本 :flag-JP: | [ftp.jaist.ac.jp/pub/Linux](https://ftp.jaist.ac.jp/pub/Linux "https://ftp.jaist.ac.jp/pub/Linux") |
    | 亞洲 · 山形大學 · 日本 :flag-JP: | [linux2.yz.yamagata-u.ac.jp/pub/Linux](https://linux2.yz.yamagata-u.ac.jp/pub/Linux "https://linux2.yz.yamagata-u.ac.jp/pub/Linux") |
    | 亞洲 · xTom · 日本 :flag-JP: | [mirrors.xtom.jp](https://mirrors.xtom.jp "https://mirrors.xtom.jp") |
    | 亞洲 · GB Network Solutions · 馬來西亞 :flag-MY: | [mirrors.gbnetwork.com](https://mirrors.gbnetwork.com "https://mirrors.gbnetwork.com") |
    | 亞洲 · 孔敬大學 · 泰國 :flag-TH: | [mirror.kku.ac.th](https://mirror.kku.ac.th "https://mirror.kku.ac.th") |

=== ":fontawesome-solid-earth-europe: 歐洲"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 歐洲 · Vorboss Ltd · 英國 :flag-GB: | [mirror.vorboss.net](https://mirror.vorboss.net "https://mirror.vorboss.net") |
    | 歐洲 · QuickHost · 英國 :flag-GB: | [mirror.quickhost.uk](https://mirror.quickhost.uk "https://mirror.quickhost.uk") |
    | 歐洲 · dogado · 德國 :flag-DE: | [mirror.dogado.de](https://mirror.dogado.de "https://mirror.dogado.de") |
    | 歐洲 · xTom · 德國 :flag-DE: | [mirrors.xtom.de](https://mirrors.xtom.de "https://mirrors.xtom.de") |
    | 歐洲 · 亞琛工業大學(RWTH Aachen) · 德國 :flag-DE: | [ftp.halifax.rwth-aachen.de](https://ftp.halifax.rwth-aachen.de "https://ftp.halifax.rwth-aachen.de") |
    | 歐洲 · 德勒斯登大學(AG DSN) · 德國 :flag-DE: | [ftp.agdsn.de](https://ftp.agdsn.de "https://ftp.agdsn.de") |
    | 歐洲 · CCIN2P3 · 法國 :flag-FR: | [mirror.in2p3.fr/pub/linux](https://mirror.in2p3.fr/pub/linux "https://mirror.in2p3.fr/pub/linux") |
    | 歐洲 · Ircam · 法國 :flag-FR: | [mirrors.ircam.fr/pub](https://mirrors.ircam.fr/pub "https://mirrors.ircam.fr/pub") |
    | 歐洲 · Crans · 法國 :flag-FR: | [eclats.crans.org](https://eclats.crans.org "https://eclats.crans.org") |
    | 歐洲 · CRIHAN · 法國 :flag-FR: | [ftp.crihan.fr](https://ftp.crihan.fr "https://ftp.crihan.fr") |
    | 歐洲 · xTom · 荷蘭 :flag-NL: | [mirrors.xtom.nl](https://mirrors.xtom.nl "https://mirrors.xtom.nl") |
    | 歐洲 · DataPacket · 荷蘭 :flag-NL: | [mirror.datapacket.com](https://mirror.datapacket.com "https://mirror.datapacket.com") |
    | 歐洲 · Linux Kernel · 荷蘭 :flag-NL: | [eu.edge.kernel.org](https://eu.edge.kernel.org "https://eu.edge.kernel.org") |
    | 歐洲 · xTom · 愛沙尼亞 :flag-EE: | [mirrors.xtom.ee](https://mirrors.xtom.ee "https://mirrors.xtom.ee") |
    | 歐洲 · netsite · 丹麥 :flag-DK: | [mirror.netsite.dk](https://mirror.netsite.dk "https://mirror.netsite.dk") |
    | 歐洲 · Dotsrc · 丹麥 :flag-DK: | [mirrors.dotsrc.org](https://mirrors.dotsrc.org "https://mirrors.dotsrc.org") |
    | 歐洲 · Academic Computer Club · 瑞典 :flag-SE: | [mirror.accum.se](https://mirror.accum.se "https://mirror.accum.se") |
    | 歐洲 · Lysator · 瑞典 :flag-SE: | [ftp.lysator.liu.se](https://ftp.lysator.liu.se "https://ftp.lysator.liu.se") |
    | 歐洲 · Yandex · 俄羅斯 :flag-RU: | [mirror.yandex.ru](https://mirror.yandex.ru "https://mirror.yandex.ru") |
    | 歐洲 · ia64 · 俄羅斯 :flag-RU: | [mirror.linux-ia64.org](https://mirror.linux-ia64.org "https://mirror.linux-ia64.org") |
    | 歐洲 · Truenetwork · 俄羅斯 :flag-RU: | [mirror.truenetwork.ru](https://mirror.truenetwork.ru "https://mirror.truenetwork.ru") |
    | 歐洲 · Belgian Research Network · 比利時 :flag-BE: | [ftp.belnet.be/mirror](https://ftp.belnet.be/mirror "https://ftp.belnet.be/mirror") |
    | 歐洲 · 克里特大學電腦中心 · 希臘 :flag-GR: | [ftp.cc.uoc.gr/mirrors/linux](https://ftp.cc.uoc.gr/mirrors/linux "https://ftp.cc.uoc.gr/mirrors/linux") |
    | 歐洲 · 馬薩里克大學信息學院 · 捷克 :flag-CZ: | [ftp.fi.muni.cz/pub/linux](https://ftp.fi.muni.cz/pub/linux "https://ftp.fi.muni.cz/pub/linux") |
    | 歐洲 · 捷克理工大學學生會俱樂部(Silicon Hill) · 捷克 :flag-CZ: | [ftp.sh.cvut.cz](https://ftp.sh.cvut.cz "https://ftp.sh.cvut.cz") |
    | 歐洲 · Vodafone · 捷克 :flag-CZ: | [mirror.karneval.cz/pub/linux](https://mirror.karneval.cz/pub/linux "https://mirror.karneval.cz/pub/linux") |
    | 歐洲 · CZ.NIC · 捷克 :flag-CZ: | [mirrors.nic.cz](https://mirrors.nic.cz "https://mirrors.nic.cz") |
    | 歐洲 · 蘇黎世聯邦理工學院 · 瑞士 :flag-CH: | [mirror.ethz.ch](https://mirror.ethz.ch "https://mirror.ethz.ch") |

=== ":fontawesome-solid-earth-americas: 北美洲"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 北美 · Linux Kernel · 美國 :flag-US: | [mirrors.kernel.org](https://mirrors.kernel.org "https://mirrors.kernel.org") |
    | 北美 · 麻省理工學院(MIT) · 美國 :flag-US: | [mirrors.mit.edu](https://mirrors.mit.edu "https://mirrors.mit.edu") |
    | 北美 · 普林斯頓大學數學系 · 美國 :flag-US: | [mirror.math.princeton.edu/pub](https://mirror.math.princeton.edu/pub "https://mirror.math.princeton.edu/pub") |
    | 北美 · 俄勒岡州立大學開源實驗室 · 美國 :flag-US: | [ftp-chi.osuosl.org/pub](https://ftp-chi.osuosl.org/pub "https://ftp-chi.osuosl.org/pub") |
    | 北美 · Fremont Cabal Internet Exchange(FCIX) · 美國 :flag-US: | [mirror.fcix.net](https://mirror.fcix.net "https://mirror.fcix.net") |
    | 北美 · xTom · 美國 :flag-US: | [mirrors.xtom.com](https://mirrors.xtom.com "https://mirrors.xtom.com") |
    | 北美 · Steadfast · 美國 :flag-US: | [mirror.steadfast.net](https://mirror.steadfast.net "https://mirror.steadfast.net") |
    | 北美 · 不列顛哥倫比亞大學 · 加拿大 :flag-CA: | [mirror.it.ubc.ca](https://mirror.it.ubc.ca "https://mirror.it.ubc.ca") |
    | 北美 · GoCodeIT · 加拿大 :flag-CA: | [mirror.xenyth.net](https://mirror.xenyth.net "https://mirror.xenyth.net") |
    | 北美 · Switch · 加拿大 :flag-CA: | [mirrors.switch.ca](https://mirrors.switch.ca "https://mirrors.switch.ca") |

=== ":fontawesome-solid-earth-americas: 南美洲"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 南美 · PoP-SC · 巴西 :flag-BR: | [mirror.pop-sc.rnp.br/mirror](https://mirror.pop-sc.rnp.br/mirror "https://mirror.pop-sc.rnp.br/mirror") |
    | 南美 · 蓬塔格羅薩州立大學 · 巴西 :flag-BR: | [mirror.uepg.br](https://mirror.uepg.br "https://mirror.uepg.br") |
    | 南美 · UFSCar · 巴西 :flag-BR: | [mirror.ufscar.br](https://mirror.ufscar.br "https://mirror.ufscar.br") |
    | 南美 · Sysarmy Community · 阿根廷 :flag-AR: | [mirrors.eze.sysarmy.com](https://mirrors.eze.sysarmy.com "https://mirrors.eze.sysarmy.com") |

=== ":fontawesome-solid-earth-oceania: 大洋洲"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 大洋 · Fremont Cabal Internet Exchange(FCIX) · 澳大利亞 :flag-AU: | [gsl-syd.mm.fcix.net](https://gsl-syd.mm.fcix.net "https://gsl-syd.mm.fcix.net") |
    | 大洋 · AARNet · 澳大利亞 :flag-AU: | [mirror.aarnet.edu.au/pub](https://mirror.aarnet.edu.au/pub "https://mirror.aarnet.edu.au/pub") |
    | 大洋 · DataMossa · 澳大利亞 :flag-AU: | [mirror.datamossa.io](https://mirror.datamossa.io "https://mirror.datamossa.io") |
    | 大洋 · Amaze · 澳大利亞 :flag-AU: | [mirror.amaze.com.au](https://mirror.amaze.com.au "https://mirror.amaze.com.au") |
    | 大洋 · xTom · 澳大利亞 :flag-AU: | [mirrors.xtom.au](https://mirrors.xtom.au "https://mirrors.xtom.au") |
    | 大洋 · Over the Wire · 澳大利亞 :flag-AU: | [mirror.overthewire.com.au](https://mirror.overthewire.com.au "https://mirror.overthewire.com.au") |
    | 大洋 · Free Software Mirror Group · 紐西蘭 :flag-NZ: | [mirror.fsmg.org.nz](https://mirror.fsmg.org.nz "https://mirror.fsmg.org.nz") |

=== ":fontawesome-solid-earth-africa: 非洲"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 非洲 · Liquid Telecom · 肯亞 :flag-KE: | [mirror.liquidtelecom.com](https://mirror.liquidtelecom.com "https://mirror.liquidtelecom.com") |
    | 非洲 · Dimension Data · 南非 :flag-ZA: | [mirror.dimensiondata.com](https://mirror.dimensiondata.com "https://mirror.dimensiondata.com") |

=== ":octicons-globe-16: 全部"

    | 鏡像站名稱 | 鏡像站位址 |
    | :- | :-: |
    | 亞洲 · xTom · 香港 :flag-HK: | [mirrors.xtom.hk](https://mirrors.xtom.hk "https://mirrors.xtom.hk") |
    | 亞洲 · 01Link · 香港 :flag-HK: | [mirror.01link.hk](https://mirror.01link.hk "https://mirror.01link.hk") |
    | 亞洲 · 新加坡國立大學(NUS) · 新加坡 :flag-SG: | [download.nus.edu.sg/mirror](https://download.nus.edu.sg "https://download.nus.edu.sg") |
    | 亞洲 · SG.GS · 新加坡 :flag-SG: | [mirror.sg.gs](https://mirror.sg.gs "https://mirror.sg.gs") |
    | 亞洲 · xTom · 新加坡 :flag-SG: | [mirrors.xtom.sg](https://mirrors.xtom.sg "https://mirrors.xtom.sg") |
    | 亞洲 · 自由軟體實驗室(NCHC) · 臺灣 :flag-TW: | [free.nchc.org.tw](https://free.nchc.org.tw "https://free.nchc.org.tw") |
    | 亞洲 · OSS Planet · 臺灣 :flag-TW: | [mirror.ossplanet.net](https://mirror.ossplanet.net "https://mirror.ossplanet.net") |
    | 亞洲 · 國立陽明交通大學 · 臺灣 :flag-TW: | [linux.cs.nctu.edu.tw](https://linux.cs.nctu.edu.tw "https://linux.cs.nctu.edu.tw") |
    | 亞洲 · 淡江大學 · 臺灣 :flag-TW: | [ftp.tku.edu.tw](https://ftp.tku.edu.tw "https://ftp.tku.edu.tw") |
    | 亞洲 · AniGil Linux Archive · 韓國 :flag-KR: | [mirror.anigil.com](https://mirror.anigil.com "https://mirror.anigil.com") |
    | 亞洲 · 工業網路安全中心(ICSCoE) · 日本 :flag-JP: | [ftp.udx.icscoe.jp/Linux](https://ftp.udx.icscoe.jp/Linux "https://ftp.udx.icscoe.jp/Linux") |
    | 亞洲 · 北陸先端科學技術大學院大學(JAIST) · 日本 :flag-JP: | [ftp.jaist.ac.jp/pub/Linux](https://ftp.jaist.ac.jp/pub/Linux "https://ftp.jaist.ac.jp/pub/Linux") |
    | 亞洲 · 山形大學 · 日本 :flag-JP: | [linux2.yz.yamagata-u.ac.jp/pub/Linux](https://linux2.yz.yamagata-u.ac.jp/pub/Linux "https://linux2.yz.yamagata-u.ac.jp/pub/Linux") |
    | 亞洲 · xTom · 日本 :flag-JP: | [mirrors.xtom.jp](https://mirrors.xtom.jp "https://mirrors.xtom.jp") |
    | 亞洲 · GB Network Solutions · 馬來西亞 :flag-MY: | [mirrors.gbnetwork.com](https://mirrors.gbnetwork.com "https://mirrors.gbnetwork.com") |
    | 亞洲 · 孔敬大學 · 泰國 :flag-TH: | [mirror.kku.ac.th](https://mirror.kku.ac.th "https://mirror.kku.ac.th") |
    | 歐洲 · Vorboss Ltd · 英國 :flag-GB: | [mirror.vorboss.net](https://mirror.vorboss.net "https://mirror.vorboss.net") |
    | 歐洲 · QuickHost · 英國 :flag-GB: | [mirror.quickhost.uk](https://mirror.quickhost.uk "https://mirror.quickhost.uk") |
    | 歐洲 · dogado · 德國 :flag-DE: | [mirror.dogado.de](https://mirror.dogado.de "https://mirror.dogado.de") |
    | 歐洲 · xTom · 德國 :flag-DE: | [mirrors.xtom.de](https://mirrors.xtom.de "https://mirrors.xtom.de") |
    | 歐洲 · 亞琛工業大學(RWTH Aachen) · 德國 :flag-DE: | [ftp.halifax.rwth-aachen.de](https://ftp.halifax.rwth-aachen.de "https://ftp.halifax.rwth-aachen.de") |
    | 歐洲 · 德勒斯登大學(AG DSN) · 德國 :flag-DE: | [ftp.agdsn.de](https://ftp.agdsn.de "https://ftp.agdsn.de") |
    | 歐洲 · CCIN2P3 · 法國 :flag-FR: | [mirror.in2p3.fr/pub/linux](https://mirror.in2p3.fr/pub/linux "https://mirror.in2p3.fr/pub/linux") |
    | 歐洲 · Ircam · 法國 :flag-FR: | [mirrors.ircam.fr/pub](https://mirrors.ircam.fr/pub "https://mirrors.ircam.fr/pub") |
    | 歐洲 · Crans · 法國 :flag-FR: | [eclats.crans.org](https://eclats.crans.org "https://eclats.crans.org") |
    | 歐洲 · CRIHAN · 法國 :flag-FR: | [ftp.crihan.fr](https://ftp.crihan.fr "https://ftp.crihan.fr") |
    | 歐洲 · xTom · 荷蘭 :flag-NL: | [mirrors.xtom.nl](https://mirrors.xtom.nl "https://mirrors.xtom.nl") |
    | 歐洲 · DataPacket · 荷蘭 :flag-NL: | [mirror.datapacket.com](https://mirror.datapacket.com "https://mirror.datapacket.com") |
    | 歐洲 · Linux Kernel · 荷蘭 :flag-NL: | [eu.edge.kernel.org](https://eu.edge.kernel.org "https://eu.edge.kernel.org") |
    | 歐洲 · xTom · 愛沙尼亞 :flag-EE: | [mirrors.xtom.ee](https://mirrors.xtom.ee "https://mirrors.xtom.ee") |
    | 歐洲 · netsite · 丹麥 :flag-DK: | [mirror.netsite.dk](https://mirror.netsite.dk "https://mirror.netsite.dk") |
    | 歐洲 · Dotsrc · 丹麥 :flag-DK: | [mirrors.dotsrc.org](https://mirrors.dotsrc.org "https://mirrors.dotsrc.org") |
    | 歐洲 · Academic Computer Club · 瑞典 :flag-SE: | [mirror.accum.se](https://mirror.accum.se "https://mirror.accum.se") |
    | 歐洲 · Lysator · 瑞典 :flag-SE: | [ftp.lysator.liu.se](https://ftp.lysator.liu.se "https://ftp.lysator.liu.se") |
    | 歐洲 · Yandex · 俄羅斯 :flag-RU: | [mirror.yandex.ru](https://mirror.yandex.ru "https://mirror.yandex.ru") |
    | 歐洲 · ia64 · 俄羅斯 :flag-RU: | [mirror.linux-ia64.org](https://mirror.linux-ia64.org "https://mirror.linux-ia64.org") |
    | 歐洲 · Truenetwork · 俄羅斯 :flag-RU: | [mirror.truenetwork.ru](https://mirror.truenetwork.ru "https://mirror.truenetwork.ru") |
    | 歐洲 · Belgian Research Network · 比利時 :flag-BE: | [ftp.belnet.be/mirror](https://ftp.belnet.be/mirror "https://ftp.belnet.be/mirror") |
    | 歐洲 · 克里特大學電腦中心 · 希臘 :flag-GR: | [ftp.cc.uoc.gr/mirrors/linux](https://ftp.cc.uoc.gr/mirrors/linux "https://ftp.cc.uoc.gr/mirrors/linux") |
    | 歐洲 · 馬薩里克大學信息學院 · 捷克 :flag-CZ: | [ftp.fi.muni.cz/pub/linux](https://ftp.fi.muni.cz/pub/linux "https://ftp.fi.muni.cz/pub/linux") |
    | 歐洲 · 捷克理工大學學生會俱樂部(Silicon Hill) · 捷克 :flag-CZ: | [ftp.sh.cvut.cz](https://ftp.sh.cvut.cz "https://ftp.sh.cvut.cz") |
    | 歐洲 · Vodafone · 捷克 :flag-CZ: | [mirror.karneval.cz/pub/linux](https://mirror.karneval.cz/pub/linux "https://mirror.karneval.cz/pub/linux") |
    | 歐洲 · CZ.NIC · 捷克 :flag-CZ: | [mirrors.nic.cz](https://mirrors.nic.cz "https://mirrors.nic.cz") |
    | 歐洲 · 蘇黎世聯邦理工學院 · 瑞士 :flag-CH: | [mirror.ethz.ch](https://mirror.ethz.ch "https://mirror.ethz.ch") |
    | 北美 · Linux Kernel · 美國 :flag-US: | [mirrors.kernel.org](https://mirrors.kernel.org "https://mirrors.kernel.org") |
    | 北美 · 麻省理工學院(MIT) · 美國 :flag-US: | [mirrors.mit.edu](https://mirrors.mit.edu "https://mirrors.mit.edu") |
    | 北美 · 普林斯頓大學數學系 · 美國 :flag-US: | [mirror.math.princeton.edu/pub](https://mirror.math.princeton.edu/pub "https://mirror.math.princeton.edu/pub") |
    | 北美 · 俄勒岡州立大學開源實驗室 · 美國 :flag-US: | [ftp-chi.osuosl.org/pub](https://ftp-chi.osuosl.org/pub "https://ftp-chi.osuosl.org/pub") |
    | 北美 · Fremont Cabal Internet Exchange(FCIX) · 美國 :flag-US: | [mirror.fcix.net](https://mirror.fcix.net "https://mirror.fcix.net") |
    | 北美 · xTom · 美國 :flag-US: | [mirrors.xtom.com](https://mirrors.xtom.com "https://mirrors.xtom.com") |
    | 北美 · Steadfast · 美國 :flag-US: | [mirror.steadfast.net](https://mirror.steadfast.net "https://mirror.steadfast.net") |
    | 北美 · 不列顛哥倫比亞大學 · 加拿大 :flag-CA: | [mirror.it.ubc.ca](https://mirror.it.ubc.ca "https://mirror.it.ubc.ca") |
    | 北美 · GoCodeIT · 加拿大 :flag-CA: | [mirror.xenyth.net](https://mirror.xenyth.net "https://mirror.xenyth.net") |
    | 北美 · Switch · 加拿大 :flag-CA: | [mirrors.switch.ca](https://mirrors.switch.ca "https://mirrors.switch.ca") |
    | 南美 · PoP-SC · 巴西 :flag-BR: | [mirror.pop-sc.rnp.br/mirror](https://mirror.pop-sc.rnp.br/mirror "https://mirror.pop-sc.rnp.br/mirror") |
    | 南美 · 蓬塔格羅薩州立大學 · 巴西 :flag-BR: | [mirror.uepg.br](https://mirror.uepg.br "https://mirror.uepg.br") |
    | 南美 · UFSCar · 巴西 :flag-BR: | [mirror.ufscar.br](https://mirror.ufscar.br "https://mirror.ufscar.br") |
    | 南美 · Sysarmy Community · 阿根廷 :flag-AR: | [mirrors.eze.sysarmy.com](https://mirrors.eze.sysarmy.com "https://mirrors.eze.sysarmy.com") |
    | 大洋 · Fremont Cabal Internet Exchange(FCIX) · 澳大利亞 :flag-AU: | [gsl-syd.mm.fcix.net](https://gsl-syd.mm.fcix.net "https://gsl-syd.mm.fcix.net") |
    | 大洋 · AARNet · 澳大利亞 :flag-AU: | [mirror.aarnet.edu.au/pub](https://mirror.aarnet.edu.au/pub "https://mirror.aarnet.edu.au/pub") |
    | 大洋 · DataMossa · 澳大利亞 :flag-AU: | [mirror.datamossa.io](https://mirror.datamossa.io "https://mirror.datamossa.io") |
    | 大洋 · Amaze · 澳大利亞 :flag-AU: | [mirror.amaze.com.au](https://mirror.amaze.com.au "https://mirror.amaze.com.au") |
    | 大洋 · xTom · 澳大利亞 :flag-AU: | [mirrors.xtom.au](https://mirrors.xtom.au "https://mirrors.xtom.au") |
    | 大洋 · Over the Wire · 澳大利亞 :flag-AU: | [mirror.overthewire.com.au](https://mirror.overthewire.com.au "https://mirror.overthewire.com.au") |
    | 大洋 · Free Software Mirror Group · 紐西蘭 :flag-NZ: | [mirror.fsmg.org.nz](https://mirror.fsmg.org.nz "https://mirror.fsmg.org.nz") |
    | 非洲 · Liquid Telecom · 肯亞 :flag-KE: | [mirror.liquidtelecom.com](https://mirror.liquidtelecom.com "https://mirror.liquidtelecom.com") |
    | 非洲 · Dimension Data · 南非 :flag-ZA: | [mirror.dimensiondata.com](https://mirror.dimensiondata.com "https://mirror.dimensiondata.com") |

## 工具網站

<button class="md-button" title="https://tool.chinaz.com" onclick="window.open('https://tool.chinaz.com')">域名查詢</button>
<button class="md-button" title="https://tools.ipip.net/newping.php" onclick="window.open('https://tools.ipip.net/newping.php')">Ping 延遲測試</button>
<button class="md-button" title="https://tools.ipip.net/traceroute.php" onclick="window.open('https://tools.ipip.net/traceroute.php')">Tracert 路由追蹤測試</button>
<button class="md-button" title="https://ipw.cn/ipv6webcheck" onclick="window.open('https://ipw.cn/ipv6webcheck')">IPv6 接取測試</button>

!!! tip "該頁面顯示的皆為腳本預設提供可供選擇的軟體源位址，如果沒有找到你想使用的也沒有關係，腳本支援命令選項可自訂使用，詳見[進階用法](../use/index.md#命令选项高级用法)"

> 本頁面涉及的旗幟圖示僅用於快速區分地理位置，不代表作者任何的政治立場，請不要過度解讀，特此聲明。
