// 使用 mkdocs-material 与第三方 JavaScript 库集成的方法
document$.subscribe(function () {
    ComponentSystem.reinitializeAll()
    // Orama AI Search
    loadOramaWebComponent()
})
