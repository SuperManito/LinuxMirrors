// 使用 mkdocs-material 与第三方 JavaScript 库集成的方法
document$.subscribe(function () {
    // 重新初始化组件
    ComponentSystem.reinitializeAll()
    // 延迟初始化以确保DOM完全渲染
    setTimeout(() => {
        ComponentSystem.initAll()
    }, 300)
})

// 首次加载事件
window.addEventListener('load', function () {
    // 初始化所有组件
    ComponentSystem.initAll()
})
