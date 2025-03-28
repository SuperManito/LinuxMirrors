const appId = 'mirrors-table' // 表格容器ID
let appInstance = null // 缓存表格容器引用
let vueApp = null // Vue 应用实例
let isInitializing = false // 是否正在初始化
let lastInitTime = 0 // 上次初始化时间
const INIT_COOLDOWN = 1000 // 初始化冷却时间(毫秒)

// 更新表格主题
function updateTableTheme() {
    const scheme = document.querySelector('[data-md-color-scheme]')?.getAttribute('data-md-color-scheme')
    const isDarkMode = scheme === 'slate' || scheme === 'dark'
    // 设置 TDesign 的主题模式
    if (isDarkMode) {
        document.documentElement.setAttribute('theme-mode', 'dark')
    } else {
        document.documentElement.removeAttribute('theme-mode')
    }
}

// 初始化表格的函数
function initTables() {
    // 如果正在初始化或者距离上次初始化时间太短，则跳过
    const now = Date.now()
    if (isInitializing || now - lastInitTime < INIT_COOLDOWN) {
        return
    }
    // 使用缓存的引用，如果没有则查询
    if (!appInstance) {
        appInstance = document.getElementById(appId)
    }
    // 如果找不到容器，不执行后续操作
    if (!appInstance) {
        return
    }
    // 如果表格已经初始化过，且DOM没有变化，则跳过
    if (appInstance.hasAttribute('data-initialized')) {
        return
    }
    // console.log('找到表格容器，初始化表格')
    isInitializing = true
    lastInitTime = now
    try {
        // 清空容器内容，防止重复初始化
        while (appInstance.firstChild) {
            appInstance.removeChild(appInstance.firstChild)
        }
        // 确保容器有适当的尺寸
        if (!appInstance.style.width) {
            appInstance.style.width = '100%'
        }
        // 确保 Vue 和 TDesign 已加载
        if (typeof Vue !== 'undefined' && typeof TDesign !== 'undefined') {
            // 创建 Vue 应用
            const App = Vue.createApp(app)
            // 注册 TDesign 组件
            App.use(TDesign.default)
            // 挂载应用
            vueApp = App.mount(appInstance)
            // console.log('表格初始化成功')
            // 标记表格已初始化
            appInstance.setAttribute('data-initialized', 'true')
            // 立即更新主题
            updateTableTheme()
        } else {
            console.error('Vue 或 TDesign 未加载')
            // 显示错误消息
            const errorDiv = document.createElement('div')
            errorDiv.style.padding = '20px'
            errorDiv.style.color = 'red'
            errorDiv.textContent = 'Vue 或 TDesign 未加载，请在 mkdocs.yml 中添加相应 CDN 链接'
            appInstance.appendChild(errorDiv)
        }
    } catch (error) {
        console.error('初始化表格时发生错误：', error)
    } finally {
        isInitializing = false
    }
}

// 初始化
function reinitializeTable() {
    appInstance = document.getElementById(appId)
    if (appInstance) {
        appInstance.removeAttribute('data-initialized')
        setTimeout(debouncedInit, 300) // 使用更短的延迟
    }
}

// 设置主题监听器
function setupThemeObserver() {
    // 监听主题变化
    const observer = new MutationObserver(() => {
        updateTableTheme()
    })
    const element = document.querySelector('[data-md-color-scheme]')
    if (element) {
        observer.observe(element, {
            attributes: true,
            attributeFilter: ['data-md-color-scheme'],
        })
    } else {
        // 如果元素不存在，等待页面加载完成后重试
        setTimeout(setupThemeObserver, 1000)
    }
}

// 使用防抖函数包装初始化逻辑
function debounce(func, wait) {
    let timeout
    return function () {
        const context = this
        const args = arguments
        clearTimeout(timeout)
        timeout = setTimeout(() => func.apply(context, args), wait)
    }
}

// 列定义
const columns = [
    { colKey: 'name', title: '镜像站', align: 'center', width: '160', fixed: 'left' },
    { colKey: 'ipv6', title: 'IPv6', align: 'center' },
    { colKey: 'epel', title: 'EPEL', align: 'center', tooltip: 'Extra Packages for Enterprise Linux (EPEL) 是由 Fedora 组织维护的一个附加软件包仓库，它主要适用于除 Fedora 操作系统以外的红帽系 Linux 发行版。' },
    { colKey: 'archlinux', title: 'Arch Linux', align: 'center' },
    { colKey: 'kalilinux', title: 'Kali Linux', align: 'center' },
    { colKey: 'armbian', title: 'Armbian', align: 'center' },
    { colKey: 'deepin', title: 'Deepin', align: 'center' },
    { colKey: 'raspberry', title: 'Raspberry Pi OS', align: 'center', width: '130' },
    { colKey: 'linuxmint', title: 'Linux Mint', align: 'center' },
    { colKey: 'proxmox', title: 'Proxmox VE', align: 'center' },
    { colKey: 'fedora', title: 'Fedora', align: 'center' },
    { colKey: 'rockylinux', title: 'Rocky Linux', align: 'center' },
    { colKey: 'almalinux', title: 'AlmaLinux', align: 'center' },
    { colKey: 'opencloudos', title: 'OpenCloudOS', align: 'center', width: '120' },
    { colKey: 'anolis', title: 'Anolis OS', align: 'center' },
    { colKey: 'openkylin', title: 'openKylin', align: 'center' },
    { colKey: 'alpinelinux', title: 'Alpine Linux', align: 'center' },
    { colKey: 'gentoo', title: 'Gentoo', align: 'center' },
    { colKey: 'nix', title: 'NixOS', align: 'center' },
]

// 修改 app 对象的模板部分，添加自定义表头渲染
const app = {
    template: `
        <div>
            <t-table
                :columns="columns"
                :data="data"
                row-key="name"
                size="small"
            >
                <template v-for="col in columns" :key="col.colKey" #[col.title]>
                    <div v-if="col.tooltip" class="t-table__th-cell-inner">
                        <t-space style="gap: 4px">
                            {{ col.title }}
                            <t-tooltip :content="col.tooltip" placement="bottom" :show-arrow="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><path fill="currentColor" d="M11.95 18q.525 0 .888-.363t.362-.887t-.362-.888t-.888-.362t-.887.363t-.363.887t.363.888t.887.362m.05 4q-2.075 0-3.9-.788t-3.175-2.137T2.788 15.9T2 12t.788-3.9t2.137-3.175T8.1 2.788T12 2t3.9.788t3.175 2.137T21.213 8.1T22 12t-.788 3.9t-2.137 3.175t-3.175 2.138T12 22m0-2q3.35 0 5.675-2.325T20 12t-2.325-5.675T12 4T6.325 6.325T4 12t2.325 5.675T12 20m.1-12.3q.625 0 1.088.4t.462 1q0 .55-.337.975t-.763.8q-.575.5-1.012 1.1t-.438 1.35q0 .35.263.588t.612.237q.375 0 .638-.25t.337-.625q.1-.525.45-.937t.75-.788q.575-.55.988-1.2t.412-1.45q0-1.275-1.037-2.087T12.1 6q-.95 0-1.812.4T8.975 7.625q-.175.3-.112.638t.337.512q.35.2.725.125t.625-.425q.275-.375.688-.575t.862-.2"/></svg>
                            </t-tooltip>
                        </t-space>
                    </div>
                    <div v-else class="t-table__th-cell-inner">{{ col.title }}</div>
                </template>
                <template v-for="col in columns" :key="col.colKey" #[col.colKey]="{ row }">
                    <template v-if="col.colKey === 'name'">
                        <t-popup placement="bottom" :show-arrow="false">
                            <template #content>
                                <a :href="row.url" target="_blank" style="color: var(--md-typeset-a-color)">{{ row.domain }}</a>
                            </template>
                            <a :href="row.url" target="_blank">{{ row.name }}</a>
                        </t-popup>
                    </template>
                    <template v-else>
                        <t-tag v-if="typeof row[col.colKey] === 'boolean'" :theme="row[col.colKey] ? 'success' : 'danger'" variant="light" size="small" style="background-color: transparent; height: 100%">
                            <template #icon>
                                <svg v-if="row[col.colKey]" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M21 7L9 19l-5.5-5.5l1.41-1.41L9 16.17L19.59 5.59L21 7Z" /></svg>
                                <svg v-else xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="vertical-align: -0.2em"><path fill="currentColor" d="M19 6.41L17.59 5L12 10.59L6.41 5L5 6.41L10.59 12L5 17.59L6.41 19L12 13.41L17.59 19L19 17.59L13.41 12L19 6.41Z"/></svg>
                            </template>
                        </t-tag>
                        <t-tag v-else theme="warning" variant="light" size="small" style="background-color: transparent">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" style="vertical-align: -0.3em"><path fill="#F6B604" d="M22.11 21.46L2.39 1.73L1.11 3l2.95 2.95A9.95 9.95 0 0 0 2 12c0 5.5 4.5 10 10 10c2.28 0 4.37-.77 6.05-2.06l2.79 2.79l1.27-1.27M12 20c-4.42 0-8-3.58-8-8c0-1.73.56-3.32 1.5-4.62L16.62 18.5A7.78 7.78 0 0 1 12 20M8.17 4.97L6.72 3.5C8.25 2.56 10.06 2 12 2c5.5 0 10 4.5 10 10c0 1.94-.56 3.75-1.5 5.28l-1.47-1.45c.62-1.14.97-2.44.97-3.83c0-4.42-3.58-8-8-8c-1.39 0-2.69.35-3.83.97Z"/></svg>
                        </t-tag>
                    </template>
                </template>
            </t-table>
        </div>
    `,
    data() {
        return {
            columns,
            data: mirrorsTableData,
        }
    },
}

// 防抖处理的初始化函数
const debouncedInit = debounce(initTables, 300)

// 仅在导航完成后监听URL变化
let lastUrl = location.href
const urlObserver = new MutationObserver(() => {
    const url = location.href
    if (url !== lastUrl) {
        lastUrl = url
        // 重置初始化状态
        appInstance = document.getElementById(appId)
        if (appInstance) {
            appInstance.removeAttribute('data-initialized')
        }
        // 延迟初始化
        setTimeout(debouncedInit, 400)
    }
})
urlObserver.observe(document, { subtree: true, childList: true })

// 页面加载事件
window.addEventListener('load', function () {
    debouncedInit()
    // 尝试找到 MkDocs 内容容器来精确监听
    const contentContainer = document.querySelector('.md-content') || document.querySelector('.md-main__inner') || document.querySelector('article') || document.body
    // 只监听这个元素的子元素变化
    urlObserver.observe(contentContainer, {
        childList: true, // 监听子节点添加或删除
        subtree: false, // 不监听所有后代变化，降低开销
        attributes: false, // 不监听属性变化
    })
    // 监听 iframe 情况下的 hashchange 和 popstate 事件
    window.addEventListener('hashchange', function () {
        if (location.href !== lastUrl) {
            lastUrl = location.href
            appInstance = null
            reinitializeTable()
        }
    })
    window.addEventListener('popstate', function () {
        if (location.href !== lastUrl) {
            lastUrl = location.href
            appInstance = null
            reinitializeTable()
        }
    })
})
document.addEventListener('DOMContentLoaded', function () {
    // 设置主题观察器
    setupThemeObserver()
})
// MkDocs 页面切换事件
document.addEventListener('DOMContentSwitch', function () {
    reinitializeTable()
})
