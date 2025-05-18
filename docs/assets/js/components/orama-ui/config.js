// get search box config
function getOramaSearchBoxConfig() {
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
        searchPlaceholder: '请输入要搜索的内容...',
        chatPlaceholder: '有什么可以帮你的吗？',
        suggestions: ['如何使用', '支持哪些系统'],
    }
}

// localization search box component
function localizationOramaSearchBox(searchBox) {
    if (!searchBox) return
    const observer = new MutationObserver((mutations, obs) => {
        const shadowRoot = searchBox.shadowRoot
        if (shadowRoot) {
            // Get a summary (Only PC)
            const chatButton = shadowRoot.querySelector('.chat-button')
            if (chatButton) {
                const element = chatButton.querySelector('.button-label')
                if (element && element.textContent !== '询问 AI') {
                    element.textContent = '询问 AI'
                }
            }
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
                    if (searchSpan && searchSpan.textContent !== '搜索') {
                        searchSpan.textContent = '搜索'
                        searchSpan.style = 'max-height: fit-content;'
                    }
                    const askAISpan = toggler.querySelector('span:nth-child(2)')
                    if (askAISpan && askAISpan.textContent !== '询问 AI') {
                        askAISpan.textContent = '询问 AI'
                        askAISpan.style = 'max-height: fit-content;'
                    }
                }
            }
        }
    })
    observer.observe(searchBox, { childList: true, subtree: true, attributes: true })
    setTimeout(() => observer.disconnect(), 2000)
}
