const themeConfig = {
    // 字体
    siteFont: '"-apple-system, "BlinkMacSystemFont", "SF Pro Display", "SF Pro", "Microsoft YaHei", "PingFang SC", "Helvetica Neue", Arial, "sans-serif"',

    // 代码块块字体
    codeFont: "SF-Mono",

    // 文字大小
    bodyFontSize: "17px",

    // 默认主题配置
    defaultTheme: "light",

    // 浅色主题配置
    light: {
        // 主题（颜色）
        themeColor: "#42b883",
        // 背景（颜色）
        backgroundColor: "#ffffff",
        // 侧边栏标题字符（颜色）
        sidebarSublinkColor: "#5c5454",
        // 标题字符（颜色）
        titleColor: "#1a1a1f",
        // 一般字符（颜色）
        textColor: "#1a1a1f",
        // 粗体字符（颜色）
        textStrongColor: "#1a1a1f",
        // 注释内容（颜色）
        blockQuoteColor: "#1a1a1f",
        // 强调字符（颜色）
        highlightColor: "#d22778",
        // 强调字符背景（颜色）
        highlightBackgroundColor: "#f6f7f8",
        // 强调字符在强调提示样式中的背景（颜色）
        highlightTipBackgroundColor: "#efefef",
        // 强调字符在普通提示样式中的背景（颜色）
        highlightWarnBackgroundColor: "#efefef",
        // 代码块块背景（颜色）
        codeBackgroundColor: "#f6f8fa",
        // 代码块块一般字符（颜色）
        codeTextColor: "#1a1a1f",
        // 代码块块类型字符（颜色）
        codeTypeColor: "#1a1a1f",
        // 代码块关键字（颜色）
        codeKeywordColor: "#e96900",
        // 代码块函数字符（颜色）
        codeFunctionColor: "#3389e1",
        // 代码块数字字符（颜色）
        codeNumberColor: "#8d90e8",
        // 代码块字符串（颜色）
        codeStringColor: "#84d115",
        // 代码块复制按钮悬浮效果背景（颜色）
        copyButtonHoverBackgroundColor: "rgb(188 188 191 / 22%)",
        // 边框（颜色）
        borderColor: "rgb(239, 239, 245)",
        // 表格边框（颜色）
        tableBorderColor: "#cccccc",
        // 表格标题背景（颜色）
        tableTheadBackgroundColor: "rgba(0,0,0,.03)",
        // 光标悬浮效果背景（颜色）
        hoverBackgroundColor: "rgb(243, 243, 245)",
        // 折叠块背景（颜色）
        summaryBackgroundColor: "#e7f7e8",
        // 超链接光标悬浮（颜色）
        herfHoverColor: "#148b55",
        // 分割线（颜色）
        hrColor: "#afafaf",
        // 灵活警告插件样式（颜色）
        alertNoteBackgroundColor: "#eef9fd",
        alertTipBackgroundColor: "#e6f6e6",
        alertWarningBackgroundColor: "#fff8e6",
        alertAttentionBackgroundColor: "#ffebec",
        // 封面背景（样式）
        coverBackground: "linear-gradient(to top, #fff1eb 0%, #ace0f9 100%)",
        // 渐变文字背景（样式）
        gradientTextColor: "-webkit-linear-gradient(315deg,#42d392 25%,#647eff)",
        // 切换主题按钮（图标）
        themeIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik0yOC4wNTI3IDQuNDEwODVDMjIuNTgyOCA1LjgzNjk1IDE4LjU0NTUgMTAuODEwNiAxOC41NDU1IDE2LjcyNzNDMTguNTQ1NSAyMy43NTY0IDI0LjI0MzYgMjkuNDU0NSAzMS4yNzI3IDI5LjQ1NDVDMzcuMTg5NCAyOS40NTQ1IDQyLjE2MzEgMjUuNDE3MiA0My41ODkxIDE5Ljk0NzNDNDMuODU4NSAyMS4yNTYgNDQgMjIuNjExNSA0NCAyNEM0NCAzNS4wNDU3IDM1LjA0NTcgNDQgMjQgNDRDMTIuOTU0MyA0NCA0IDM1LjA0NTcgNCAyNEM0IDEyLjk1NDMgMTIuOTU0MyA0IDI0IDRDMjUuMzg4NSA0IDI2Ljc0NCA0LjE0MTQ5IDI4LjA1MjcgNC40MTA4NVoiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzFhMWExZiIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+PC9zdmc+")',
        // 收起菜单按钮（图标）
        collapseMenuIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik04IDEwLjVINDAiIHN0cm9rZT0iIzQyYjg4MyIgc3Ryb2tlLXdpZHRoPSIzIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48cGF0aCBkPSJNMjQgMTkuNUg0MCIgc3Ryb2tlPSIjNDJiODgzIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yNCAyOC41SDQwIiBzdHJva2U9IiM0MmI4ODMiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+PHBhdGggZD0iTTggMzcuNUg0MCIgc3Ryb2tlPSIjNDJiODgzIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik04IDE5TDE2IDI0TDggMjlWMTlaIiBmaWxsPSIjNDJiODgzIiBzdHJva2U9IiM0MmI4ODMiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjwvc3ZnPg==")',
        // 展开菜单按钮（图标）
        expandMenuIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik04IDEwLjVINDAiIHN0cm9rZT0iIzQyYjg4MyIgc3Ryb2tlLXdpZHRoPSIzIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48cGF0aCBkPSJNMjQgMTkuNUg0MCIgc3Ryb2tlPSIjNDJiODgzIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yNCAyOC41SDQwIiBzdHJva2U9IiM0MmI4ODMiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+PHBhdGggZD0iTTggMzcuNUg0MCIgc3Ryb2tlPSIjNDJiODgzIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0xNiAxOUw4IDI0TDE2IDI5VjE5WiIgZmlsbD0iIzQyYjg4MyIgc3Ryb2tlPSIjNDJiODgzIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48L3N2Zz4=")',
    },

    // 深色主题配置
    dark: {
        // 主题（颜色）
        themeColor: "#4894df",
        // 背景（颜色）
        backgroundColor: "#1b1b1d",
        // 侧边栏标题字符（颜色）
        sidebarSublinkColor: "#b4b4b4",
        // 标题字符（颜色）
        titleColor: "#e3e3e3",
        // 一般字符（颜色）
        textColor: "#e3e3e3",
        // 粗体字符（颜色）
        textStrongColor: "#e3e3e3",
        // 注释内容（颜色）
        blockQuoteColor: "#e3e3e3",
        // 强调字符（颜色）
        highlightColor: "#c792ea",
        // 强调字符背景（颜色）
        highlightBackgroundColor: "hsla(0,0%,100%,.1)",
        // 强调字符在强调提示样式中的背景（颜色）
        highlightTipBackgroundColor: "hsl(0deg 0% 41% / 10%)",
        // 强调字符在普通提示样式中的背景（颜色）
        highlightWarnBackgroundColor: "#36423a",
        // 代码块块背景（颜色）
        codeBackgroundColor: "#212121",
        // 代码块一般字符（颜色）
        codeTextColor: "#d4d4d4",
        // 代码块块类型字符（颜色）
        codeTypeColor: "#d4d4d4",
        // 代码块关键字（颜色）
        codeKeywordColor: "#89ddff",
        // 代码块函数字符（颜色）
        codeFunctionColor: "#ffcb6b",
        // 代码块数字字符（颜色）
        codeNumberColor: "#c3e88d",
        // 代码块字符串（颜色）
        codeStringColor: "#5987cb",
        // 代码块块复制按钮悬浮效果背景（颜色）
        copyButtonHoverBackgroundColor: "#8d8d8d1f",
        // 边框（颜色）
        borderColor: "rgba(255, 255, 255, 0.09)",
        // 表格边框（颜色）
        tableBorderColor: "#606770",
        // 表格标题背景（颜色）
        tableTheadBackgroundColor: "hsla(0,0%,100%,.07)",
        // 光标悬浮效果背景（颜色）
        hoverBackgroundColor: "#8d8d8d1f",
        // 折叠块背景（颜色）
        summaryBackgroundColor: "#1d364c",
        // 超链接光标悬浮（颜色）
        herfHoverColor: "#196fbf",
        // 分割线（颜色）
        hrColor: "#464646",
        // 灵活警告插件样式（颜色）
        alertNoteBackgroundColor: "#193c47",
        alertTipBackgroundColor: "#003100",
        alertWarningBackgroundColor: "#4d3800",
        alertAttentionBackgroundColor: "#4b1113",
        // 封面背景（样式）
        coverBackground: "linear-gradient(to top, #fff1eb 0%, #ace0f9 100%)",
        // 渐变文字背景（样式）
        gradientTextColor: "linear-gradient(90deg,#7209d4,#2832d4 33%,#00a5b2)",
        // 切换主题按钮（图标）
        themeIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik0yNCAzN0MzMS4xNzk3IDM3IDM3IDMxLjE3OTcgMzcgMjRDMzcgMTYuODIwMyAzMS4xNzk3IDExIDI0IDExQzE2LjgyMDMgMTEgMTEgMTYuODIwMyAxMSAyNEMxMSAzMS4xNzk3IDE2LjgyMDMgMzcgMjQgMzdaIiBmaWxsPSJub25lIiBzdHJva2U9IiNlM2UzZTMiIHN0cm9rZS13aWR0aD0iNCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yNCA2QzI1LjM4MDcgNiAyNi41IDQuODgwNzEgMjYuNSAzLjVDMjYuNSAyLjExOTI5IDI1LjM4MDcgMSAyNCAxQzIyLjYxOTMgMSAyMS41IDIuMTE5MjkgMjEuNSAzLjVDMjEuNSA0Ljg4MDcxIDIyLjYxOTMgNiAyNCA2WiIgZmlsbD0iI2UzZTNlMyIvPjxwYXRoIGQ9Ik0zOC41IDEyQzM5Ljg4MDcgMTIgNDEgMTAuODgwNyA0MSA5LjVDNDEgOC4xMTkyOSAzOS44ODA3IDcgMzguNSA3QzM3LjExOTMgNyAzNiA4LjExOTI5IDM2IDkuNUMzNiAxMC44ODA3IDM3LjExOTMgMTIgMzguNSAxMloiIGZpbGw9IiNlM2UzZTMiLz48cGF0aCBkPSJNNDQuNSAyNi41QzQ1Ljg4MDcgMjYuNSA0NyAyNS4zODA3IDQ3IDI0QzQ3IDIyLjYxOTMgNDUuODgwNyAyMS41IDQ0LjUgMjEuNUM0My4xMTkzIDIxLjUgNDIgMjIuNjE5MyA0MiAyNEM0MiAyNS4zODA3IDQzLjExOTMgMjYuNSA0NC41IDI2LjVaIiBmaWxsPSIjZTNlM2UzIi8+PHBhdGggZD0iTTM4LjUgNDFDMzkuODgwNyA0MSA0MSAzOS44ODA3IDQxIDM4LjVDNDEgMzcuMTE5MyAzOS44ODA3IDM2IDM4LjUgMzZDMzcuMTE5MyAzNiAzNiAzNy4xMTkzIDM2IDM4LjVDMzYgMzkuODgwNyAzNy4xMTkzIDQxIDM4LjUgNDFaIiBmaWxsPSIjZTNlM2UzIi8+PHBhdGggZD0iTTI0IDQ3QzI1LjM4MDcgNDcgMjYuNSA0NS44ODA3IDI2LjUgNDQuNUMyNi41IDQzLjExOTMgMjUuMzgwNyA0MiAyNCA0MkMyMi42MTkzIDQyIDIxLjUgNDMuMTE5MyAyMS41IDQ0LjVDMjEuNSA0NS44ODA3IDIyLjYxOTMgNDcgMjQgNDdaIiBmaWxsPSIjZTNlM2UzIi8+PHBhdGggZD0iTTkuNSA0MUMxMC44ODA3IDQxIDEyIDM5Ljg4MDcgMTIgMzguNUMxMiAzNy4xMTkzIDEwLjg4MDcgMzYgOS41IDM2QzguMTE5MjkgMzYgNyAzNy4xMTkzIDcgMzguNUM3IDM5Ljg4MDcgOC4xMTkyOSA0MSA5LjUgNDFaIiBmaWxsPSIjZTNlM2UzIi8+PHBhdGggZD0iTTMuNSAyNi41QzQuODgwNzEgMjYuNSA2IDI1LjM4MDcgNiAyNEM2IDIyLjYxOTMgNC44ODA3MSAyMS41IDMuNSAyMS41QzIuMTE5MjkgMjEuNSAxIDIyLjYxOTMgMSAyNEMxIDI1LjM4MDcgMi4xMTkyOSAyNi41IDMuNSAyNi41WiIgZmlsbD0iI2UzZTNlMyIvPjxwYXRoIGQ9Ik05LjUgMTJDMTAuODgwNyAxMiAxMiAxMC44ODA3IDEyIDkuNUMxMiA4LjExOTI5IDEwLjg4MDcgNyA5LjUgN0M4LjExOTI5IDcgNyA4LjExOTI5IDcgOS41QzcgMTAuODgwNyA4LjExOTI5IDEyIDkuNSAxMloiIGZpbGw9IiNlM2UzZTMiLz48L3N2Zz4=")',
        // 收起菜单按钮（图标）
        collapseMenuIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik04IDEwLjVINDAiIHN0cm9rZT0iIzQ4OTRkZiIgc3Ryb2tlLXdpZHRoPSIzIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48cGF0aCBkPSJNMjQgMTkuNUg0MCIgc3Ryb2tlPSIjNDg5NGRmIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yNCAyOC41SDQwIiBzdHJva2U9IiM0ODk0ZGYiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+PHBhdGggZD0iTTggMzcuNUg0MCIgc3Ryb2tlPSIjNDg5NGRmIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik04IDE5TDE2IDI0TDggMjlWMTlaIiBmaWxsPSIjNDg5NGRmIiBzdHJva2U9IiM0ODk0ZGYiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjwvc3ZnPg==")',
        // 展开菜单按钮（图标）
        expandMenuIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik04IDEwLjVINDAiIHN0cm9rZT0iIzQ4OTRkZiIgc3Ryb2tlLXdpZHRoPSIzIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48cGF0aCBkPSJNMjQgMTkuNUg0MCIgc3Ryb2tlPSIjNDg5NGRmIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yNCAyOC41SDQwIiBzdHJva2U9IiM0ODk0ZGYiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+PHBhdGggZD0iTTggMzcuNUg0MCIgc3Ryb2tlPSIjNDg5NGRmIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0xNiAxOUw4IDI0TDE2IDI5VjE5WiIgZmlsbD0iIzQ4OTRkZiIgc3Ryb2tlPSIjNDg5NGRmIiBzdHJva2Utd2lkdGg9IjMiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48L3N2Zz4=")',
    },

    // 灵活警告插件样式
    alertNoteBorderColor: "#4cb3d4",
    alertNoteHighlightBackgroundColor: "rgba(84,199,236,0.15)",
    alertNoteIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik0yNCA0NEMyOS41MjI4IDQ0IDM0LjUyMjggNDEuNzYxNCAzOC4xNDIxIDM4LjE0MjFDNDEuNzYxNCAzNC41MjI4IDQ0IDI5LjUyMjggNDQgMjRDNDQgMTguNDc3MiA0MS43NjE0IDEzLjQ3NzIgMzguMTQyMSA5Ljg1Nzg2QzM0LjUyMjggNi4yMzg1OCAyOS41MjI4IDQgMjQgNEMxOC40NzcyIDQgMTMuNDc3MiA2LjIzODU4IDkuODU3ODYgOS44NTc4NkM2LjIzODU4IDEzLjQ3NzIgNCAxOC40NzcyIDQgMjRDNCAyOS41MjI4IDYuMjM4NTggMzQuNTIyOCA5Ljg1Nzg2IDM4LjE0MjFDMTMuNDc3MiA0MS43NjE0IDE4LjQ3NzIgNDQgMjQgNDRaIiBmaWxsPSIjNGNiM2Q0IiBzdHJva2U9IiM0Y2IzZDQiIHN0cm9rZS13aWR0aD0iNCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMjQgMTFDMjUuMzgwNyAxMSAyNi41IDEyLjExOTMgMjYuNSAxMy41QzI2LjUgMTQuODgwNyAyNS4zODA3IDE2IDI0IDE2QzIyLjYxOTMgMTYgMjEuNSAxNC44ODA3IDIxLjUgMTMuNUMyMS41IDEyLjExOTMgMjIuNjE5MyAxMSAyNCAxMVoiIGZpbGw9IiNGRkYiLz48cGF0aCBkPSJNMjQuNSAzNFYyMEgyMy41SDIyLjUiIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48cGF0aCBkPSJNMjEgMzRIMjgiIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48L3N2Zz4=")',
    alertTipBorderColor: "#009400",
    alertTipHighlightBackgroundColor: "rgba(0,164,0,0.15)",
    alertTipIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik00MCAyMEM0MCAyNi44MDc3IDM1Ljc0ODQgMzIuNjIyNCAyOS43NTU1IDM0LjkzMzZIMjRIMTguMjQ0NUMxMi4yNTE2IDMyLjYyMjQgOCAyNi44MDc3IDggMjBDOCAxMS4xNjM0IDE1LjE2MzQgNCAyNCA0QzMyLjgzNjYgNCA0MCAxMS4xNjM0IDQwIDIwWiIgZmlsbD0iIzAwOTQwMCIgc3Ryb2tlPSIjMDA5NDAwIiBzdHJva2Utd2lkdGg9IjQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yOS43NTU3IDM0LjkzMzZMMjkuMDc2NiA0My4wODMxQzI5LjAzMzQgNDMuNjAxNCAyOC42MDAxIDQ0IDI4LjA4IDQ0SDE5LjkyMDNDMTkuNDAwMiA0NCAxOC45NjY5IDQzLjYwMTQgMTguOTIzOCA0My4wODMxTDE4LjI0NDYgMzQuOTMzNiIgc3Ryb2tlPSIjMDA5NDAwIiBzdHJva2Utd2lkdGg9IjQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0xOCAxN1YyM0wyNCAyMEwzMCAyM1YxNyIgc3Ryb2tlPSIjRkZGIiBzdHJva2Utd2lkdGg9IjQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjwvc3ZnPg==")',
    alertWarningBorderColor: "#e6a700",
    alertWarningHighlightBackgroundColor: "rgba(255,186,0,0.15)",
    alertWarningIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik0yNCA0QzE2LjI2OCA0IDEwIDEwLjI2OCAxMCAxOFYzOEgzOFYxOEMzOCAxMC4yNjggMzEuNzMyIDQgMjQgNFoiIGZpbGw9IiNlNmE3MDAiLz48cGF0aCBkPSJNMTAgMzhWMThDMTAgMTAuMjY4IDE2LjI2OCA0IDI0IDRDMzEuNzMyIDQgMzggMTAuMjY4IDM4IDE4VjM4TTQgMzhINDQiIHN0cm9rZT0iI2U2YTcwMCIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48cGF0aCBkPSJNMjQgNDRDMjYuNzYxNCA0NCAyOSA0MS43NjE0IDI5IDM5VjM4SDE5VjM5QzE5IDQxLjc2MTQgMjEuMjM4NiA0NCAyNCA0NFoiIGZpbGw9IiNlNmE3MDAiIHN0cm9rZT0iI2U2YTcwMCIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48L3N2Zz4=")',
    alertAttentionBorderColor: "#e13238",
    alertAttentionHighlightBackgroundColor: "rgba(250,56,62,0.15)",
    alertAttentionIcon: 'url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDQ4IDQ4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMjQgNUwyIDQzSDQ2TDI0IDVaIiBmaWxsPSIjZTEzMjM4IiBzdHJva2U9IiNlMTMyMzgiIHN0cm9rZS13aWR0aD0iNCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yNCAzNVYzNiIgc3Ryb2tlPSIjRkZGIiBzdHJva2Utd2lkdGg9IjQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPjxwYXRoIGQ9Ik0yNCAxOS4wMDA1TDI0LjAwODMgMjkiIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiLz48L3N2Zz4=")',
};
