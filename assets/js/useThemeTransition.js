function useThemeTransition() {
    let isProgrammaticClick = false // 防止程序触发的点击再次进入处理函数
    let isAnimating = false // 防止快速点击导致多个动画同时运行

    function handleThemeToggle(e) {
        // 如果是程序触发的点击，或者正在播放动画，则忽略此次点击
        if (isProgrammaticClick || isAnimating) return
        e.preventDefault()
        e.stopPropagation()
        const targetId = this.getAttribute('for')
        const targetInput = document.getElementById(targetId)
        if (!targetInput) return
        const targetTheme = targetInput.getAttribute('data-md-color-scheme')
        const systemTheme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'slate' : 'default'
        const currentScheme = document.body.getAttribute('data-md-color-scheme')
        let newScheme = targetTheme === 'system' ? systemTheme : targetTheme
        // 主题没变化，不启动动画，但仍需切换 input 以维持 MkDocs 内部状态
        if (newScheme === currentScheme) {
            isProgrammaticClick = true
            targetInput.click()
            isProgrammaticClick = false
            return
        }
        // 防止动画期间再次触发
        isAnimating = true
        const x = e.clientX
        const y = e.clientY
        const endRadius = Math.hypot(Math.max(x, window.innerWidth - x), Math.max(y, window.innerHeight - y))
        const transition = document.startViewTransition(() => {
            isProgrammaticClick = true
            targetInput.click()
            isProgrammaticClick = false
        })
        transition.ready
            .then(() => {
                // 新视图的裁剪扩散动画
                const newViewAnim = document.documentElement.animate(
                    {
                        clipPath: [`circle(0 at ${x}px ${y}px)`, `circle(${endRadius}px at ${x}px ${y}px)`],
                    },
                    {
                        duration: 500,
                        easing: 'cubic-bezier(0.4, 0, 0.2, 1)',
                        pseudoElement: '::view-transition-new(root)',
                        fill: 'forwards',
                    },
                )
                // 旧视图保持完全显示
                const oldViewAnim = document.documentElement.animate(
                    { opacity: [1, 1] },
                    {
                        duration: 500,
                        pseudoElement: '::view-transition-old(root)',
                        fill: 'forwards',
                    },
                )
                // 等待所有自定义动画结束后解锁
                Promise.all([newViewAnim.finished, oldViewAnim.finished])
                    .then(() => {
                        isAnimating = false
                    })
                    .catch(() => {
                        // 动画被取消（如快速切走）时也要解锁
                        isAnimating = false
                    })
            })
            .catch(() => {
                // 如果 startViewTransition 被拒绝（如跳过），立即解锁
                isAnimating = false
            })
    }
    // 不支持 View Transition API 则直接返回
    if (typeof document.startViewTransition !== 'function') return
    const themeToggles = document.querySelectorAll('form[data-md-component="palette"] .md-header__button.md-icon')
    themeToggles.forEach((toggle) => {
        toggle.removeEventListener('click', handleThemeToggle, true)
        toggle.addEventListener('click', handleThemeToggle, { capture: true })
    })
    // 初始化主题状态类
    const currentScheme = document.body.getAttribute('data-md-color-scheme')
    const isDark = currentScheme.includes('slate')
    document.documentElement.classList.add(isDark ? 'dark' : 'light')
}

document.addEventListener('DOMContentLoaded', function () {
    useThemeTransition()
})
