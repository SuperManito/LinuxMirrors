// 更新 TDesign 主题
function updateTDesignGlobalTheme() {
    const scheme = document.querySelector('[data-md-color-scheme]')?.getAttribute('data-md-color-scheme')
    const isDarkMode = scheme === 'slate' || scheme === 'dark'
    if (isDarkMode) {
        document.documentElement.setAttribute('theme-mode', 'dark')
    } else {
        document.documentElement.removeAttribute('theme-mode')
    }
}

// 主题监听器
function setupThemeObserver() {
    // 监听主题变化
    const observer = new MutationObserver(() => {
        updateTDesignGlobalTheme()
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

document.addEventListener('DOMContentLoaded', function () {
    setupThemeObserver()
})
