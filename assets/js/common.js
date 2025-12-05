const __p = typeof window !== 'undefined' && window.location && window.location.pathname ? window.location.pathname : ''
const __isZhHant = __p.includes('/zh-Hant')
const __isEn = __p.includes('/en')

// 防抖
function debounce(func, wait) {
    let timeout
    return function () {
        const context = this
        const args = arguments
        clearTimeout(timeout)
        timeout = setTimeout(() => func.apply(context, args), wait)
    }
}

// 组件管理系统（每个组件都是一个 Vue 实例）
const ComponentSystem = {
    // 组件状态数据
    components: {},

    // 注册组件
    register: function (componentId, componentDef) {
        // 为每个组件创建自己的状态
        this.components[componentId] = {
            id: componentId,
            instance: null,
            isInitializing: false,
            lastInitTime: 0,
            def: componentDef,
            debouncedInit: null,
            app: null,
        }
        // 创建组件初始化函数
        const initFunc = function () {
            const component = ComponentSystem.components[componentId]
            // 如果正在初始化或者距离上次初始化时间太短，则跳过
            const now = Date.now()
            if (component.isInitializing || now - component.lastInitTime < 1000) {
                return
            }
            // 使用缓存，如果没有则查询
            if (!component.instance) {
                component.instance = document.getElementById(componentId)
            }
            // 如果找不到容器，不执行后续操作
            if (!component.instance) {
                return
            }
            // 如果组件已经初始化过，且DOM没有变化，则跳过
            if (component.instance.hasAttribute('data-initialized')) {
                return
            }
            // console.log(`找到组件 ${componentId} 容器，开始初始化`)
            component.isInitializing = true
            component.lastInitTime = now
            try {
                if (component.app && typeof component.app.unmount === 'function') {
                    try {
                        component.app.unmount()
                    } catch (err) {
                        console.error('组件卸载失败', err)
                    }
                    component.app = null
                }
                // 清空容器内容，防止重复初始化
                while (component.instance.firstChild) {
                    component.instance.removeChild(component.instance.firstChild)
                }
                // 确保容器有适当的尺寸
                if (!component.instance.style.width) {
                    component.instance.style.width = '100%'
                }
                // 确保 Vue 和 TDesign 已加载
                if (typeof Vue !== 'undefined' && typeof TDesign !== 'undefined') {
                    // 创建 Vue 应用
                    const App = Vue.createApp(component.def)
                    // 注册 TDesign 组件
                    App.use(TDesign.default)
                    // 挂载应用
                    App.mount(component.instance)
                    // 保存 app 引用以便后续卸载
                    component.app = App
                    // console.log(`组件 ${componentId} 初始化成功`)
                    // 标记组件已初始化
                    component.instance.setAttribute('data-initialized', 'true')
                    // 立即更新主题
                    updateTDesignGlobalTheme()
                } else if (typeof Vue !== 'undefined') {
                    console.error('Vue 未找到')
                    const errorDiv = document.createElement('div')
                    errorDiv.innerHTML = `<div class="admonition failure"><p class="admonition-title">组件 ${componentId} 加载失败，请检查 Vue 是否存在！</p></div>`
                    component.instance.appendChild(errorDiv)
                } else if (typeof TDesign !== 'undefined') {
                    console.error('TDesign UI 未找到')
                    const errorDiv = document.createElement('div')
                    errorDiv.innerHTML = `<div class="admonition failure"><p class="admonition-title">组件 ${componentId} 加载失败，请检查 TDesign UI 是否存在！</p></div>`
                    component.instance.appendChild(errorDiv)
                }
            } catch (error) {
                console.error(`组件 ${componentId} 初始化时发生错误：${error}`)
            } finally {
                component.isInitializing = false
            }
        }
        // 为每个组件创建防抖初始化函数
        this.components[componentId].debouncedInit = debounce(initFunc, 300)
        return this.components[componentId].debouncedInit
    },

    // 初始化所有组件
    initAll: function () {
        Object.values(this.components).forEach((component) => {
            if (component.debouncedInit) {
                component.debouncedInit()
            }
        })
    },

    // 重新初始化组件
    reinitialize: function (componentId) {
        const component = this.components[componentId]
        if (component) {
            component.instance = document.getElementById(componentId)
            if (component.instance) {
                if (component.app && typeof component.app.unmount === 'function') {
                    try {
                        component.app.unmount()
                    } catch (err) {
                        console.error('组件初始化失败', err)
                    }
                    component.app = null
                }
                component.instance.removeAttribute('data-initialized')
                setTimeout(component.debouncedInit, 300)
            }
        }
    },

    // 重新初始化所有组件
    reinitializeAll: function () {
        Object.keys(this.components).forEach((id) => {
            this.reinitialize(id)
        })
    },
}
