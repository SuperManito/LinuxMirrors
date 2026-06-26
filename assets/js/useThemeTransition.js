function useThemeTransition() {
    // 更新过渡样式变量
    function updateViewTransitionVariables(isDarkTheme) {
        document.documentElement.style.setProperty('--view-transition-z-index-foreground', isDarkTheme ? '999' : '1')
        document.documentElement.style.setProperty('--view-transition-z-index-background', isDarkTheme ? '1' : '999')
    }
    // 切换主题按钮点击事件
    function handleThemeToggle(e) {
        // 阻止默认点击事件
        e.preventDefault()
        e.stopPropagation()
        // 获取目标输入元素
        const targetId = this.getAttribute('for')
        const targetInput = document.getElementById(targetId)
        if (!targetInput) return
        // 获取主题状态
        const targetTheme = targetInput.getAttribute('data-md-color-scheme') // 目标主题（system、default、slate）
        const systemTheme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'slate' : 'default' // 系统主题（default、slate）
        const currentScheme = document.body.getAttribute('data-md-color-scheme') // 当前主题（default、slate）
        // 当目标主题与当前主题相同时不触发动画
        if (targetTheme === 'system') {
            if (systemTheme === currentScheme) {
                targetInput.click()
                return
            }
        } else if (targetTheme === currentScheme) {
            targetInput.click()
            return
        }
        // 当前主题状态
        const isSystemDarkTheme = systemTheme === 'slate' // 系统是否为深色主题
        const isCurrentDarkTheme = currentScheme.includes('slate') // 当前是否为深色主题
        const isSwitchToDarkTheme = !isCurrentDarkTheme // 是否将切换到深色主题
        // 根据系统主题设置动画样式
        updateViewTransitionVariables(isSystemDarkTheme)
        // 判断切换方向是否与系统主题一致
        // 如果系统是深色，切换到深色是"靠近系统"；如果系统是浅色，切换到浅色是"靠近系统"
        const isMovingTowardsSystemTheme = (isSwitchToDarkTheme && isSystemDarkTheme) || (!isSwitchToDarkTheme && !isSystemDarkTheme)
        // 动画参数
        const x = e.clientX
        const y = e.clientY
        const endRadius = Math.hypot(Math.max(x, window.innerWidth - x), Math.max(y, window.innerHeight - y))
        const clipPath = [`circle(0px at ${x}px ${y}px)`, `circle(${endRadius}px at ${x}px ${y}px)`]
        // 启动视图过渡
        document
            .startViewTransition(async () => {
                // 切换主题
                targetInput.click()
                // 添加CSS类用于动画控制
                document.documentElement.classList.remove(isSwitchToDarkTheme ? 'light' : 'dark')
                document.documentElement.classList.add(isSwitchToDarkTheme ? 'dark' : 'light')
                // 等待主题变化完成
                await new Promise((resolve) => setTimeout(resolve, 100))
            })
            .ready.then(() => {
                // 当朝向系统主题方向变化时使用使用缩小效果（reversed clipPath），反之放大效果（clipPath）
                document.documentElement.animate(
                    {
                        clipPath: isMovingTowardsSystemTheme ? [...clipPath].reverse() : clipPath,
                        transform: 'translateZ(0)',
                    },
                    {
                        duration: 500,
                        easing: 'ease-in',
                        pseudoElement: isMovingTowardsSystemTheme ? '::view-transition-old(root)' : '::view-transition-new(root)',
                    }
                )
            })
    }

    // 不支持此特性
    if (typeof document.startViewTransition !== 'function') {
        return
    }
    // 获取主题切换按钮Dom
    const themeToggles = document.querySelectorAll('form[data-md-component="palette"] .md-header__button.md-icon')
    themeToggles.forEach((toggle) => {
        toggle.addEventListener('click', handleThemeToggle, { capture: true })
    })
    // 初始化主题状态类
    const currentScheme = document.body.getAttribute('data-md-color-scheme')
    const isDark = currentScheme.includes('slate')
    document.documentElement.classList.add(isDark ? 'dark' : 'light')
    // 初始化过渡样式变量
    updateViewTransitionVariables(isDark)
}

document.addEventListener('DOMContentLoaded', function () {
    useThemeTransition()
})
