// get search box config
function getOramaSearchBoxConfig() {
    const isDefaultLang = window.location.pathname.includes('/zh-Hant') ? false : true
    return {
        themeConfig: {
            // colors: {
            //     light: {
            //         '--text-color-accent': 'var(--md-accent-fg-color)',
            //         '--background-color-tertiary': 'var(--md-accent-fg-color--transparent)',
            //         '--background-color-accent': 'var(--md-accent-fg-color)',
            //         '--border-color-accent': 'var(--md-accent-fg-color)',
            //         '--button-background-color-primary': 'var(--md-accent-fg-color)',
            //         '--button-background-color-secondary': 'hsla(240, 9%, 75%, 0.33)',
            //         '--button-background-color-secondary-hover': 'var(--md-accent-fg-color--transparent)',
            //         '--chat-button-border-color-gradientThree': 'var(--md-accent-fg-color)',
            //         '--chat-button-border-color-gradientFour': 'var(--md-accent-fg-color)',
            //         '--chat-button-background-color-gradientOne': 'var(--md-accent-fg-color)',
            //     },
            //     dark: {
            //         '--text-color-accent': 'var(--md-accent-fg-color)',
            //         '--background-color-primary': 'var(--md-default-bg-color--dark)',
            //         '--background-color-secondary': '#1a1b20',
            //         '--background-color-tertiary': 'var(--md-accent-fg-color--transparent)',
            //         '--background-color-accent': 'var(--md-accent-fg-color)',
            //         '--border-color-accent': 'var(--md-accent-fg-color)',
            //         '--icon-color-reverse': 'var(--md-default-bg-color--dark)',
            //         '--button-background-color-primary': 'var(--md-accent-fg-color)',
            //         '--button-background-color-secondary': 'hsla(var(--md-hue), 15%, 9%, 0.33)',
            //         '--button-background-color-secondary-hover': 'var(--md-accent-fg-color--transparent)',
            //         '--chat-button-border-color-gradientThree': 'var(--md-accent-fg-color)',
            //         '--chat-button-border-color-gradientFour': 'var(--md-accent-fg-color)',
            //         '--chat-button-background-color-gradientOne': 'var(--md-accent-fg-color)',
            //     },
            // },
            // shadow: {
            //     '--textarea-shadow': 'var(--md-shadow-z1)',
            // },
            // typography: {
            //     '--font-primary': 'var(--md-font-family)',
            // },
        },
        index: {
            endpoint: 'https://cloud.orama.run/v1/indexes/linuxmirrors-cn-imxypv',
            api_key: 'mBJ0b68dZIk79DqCkdUSJI6yQMo4L4o3',
        },
        facetProperty: 'category',
        sourceBaseUrl: 'https://linuxmirrors.cn',
        sourcesMap: {
            title: 'title',
        },
        resultMap: {
            title: 'title',
            description: 'content',
            section: 'category',
        },
        searchPlaceholder: isDefaultLang ? '请输入要搜索的内容...' : '請輸入要搜尋的內容...',
        chatPlaceholder: isDefaultLang ? '有什么可以帮你的吗？' : '有什麼可以幫你的嗎？',
        suggestions: isDefaultLang ? ['如何使用', '支持哪些系统'] : ['如何使用', '支援哪些系統'],
    }
}

// localization search box component
function localizationOramaSearchBox(searchBox) {
    if (!searchBox) return
    const isDefaultLang = window.location.pathname.includes('/zh-Hant') ? false : true
    const askAiText = isDefaultLang ? '询问 AI' : '詢問 AI'
    const searchText = isDefaultLang ? '搜索' : '搜尋'
    const observer = new MutationObserver((mutations, obs) => {
        const shadowRoot = searchBox.shadowRoot
        if (shadowRoot) {
            // Get a summary (Only PC)
            const chatButton = shadowRoot.querySelector('.chat-button')
            if (chatButton) {
                const element = chatButton.querySelector('.button-label')
                if (element && element.textContent !== askAiText) {
                    element.textContent = askAiText
                }
            }
            // Keyboard shortcuts localization (Only PC)
            const toSelectText = isDefaultLang ? '选择' : '選擇'
            const toNavigateText = isDefaultLang ? '导航' : '導航'
            const toCloseText = isDefaultLang ? '关闭' : '關閉'
            const shortcutDescriptions = shadowRoot.querySelectorAll('.shortcut-description')
            shortcutDescriptions.forEach((element) => {
                if (element.textContent === 'to select' && element.textContent !== toSelectText) {
                    element.textContent = toSelectText
                } else if (element.textContent === 'to navigate' && element.textContent !== toNavigateText) {
                    element.textContent = toNavigateText
                } else if (element.textContent === 'to close' && element.textContent !== toCloseText) {
                    element.textContent = toCloseText
                }
            })
            // Hide "Orama can make mistakes. Please verify the information."
            const chatFormWrapper = shadowRoot.querySelector('.chat-form-wrapper')
            if (chatFormWrapper) {
                const element = chatFormWrapper.querySelector('p.small.text-center')
                if (element) {
                    element.style = 'display: none;'
                }
            }
            // Navigation bar (Only Mobile)
            const navigationBar = shadowRoot.querySelector('orama-navigation-bar')
            if (navigationBar) {
                const toggler = navigationBar.querySelector('orama-toggler')
                if (toggler) {
                    const searchSpan = toggler.querySelector('span:nth-child(1)')
                    if (searchSpan && searchSpan.textContent !== searchText) {
                        searchSpan.textContent = searchText
                        searchSpan.style = 'max-height: fit-content;'
                    }
                    const askAISpan = toggler.querySelector('span:nth-child(2)')
                    if (askAISpan && askAISpan.textContent !== askAiText) {
                        askAISpan.textContent = askAiText
                        askAISpan.style = 'max-height: fit-content;'
                    }
                }
            }
        }
    })
    observer.observe(searchBox, { childList: true, subtree: true, attributes: true })
    setTimeout(() => observer.disconnect(), 2000)
}
