const OramaI18nData = {
    'zh-Hans': {
        suggestions: ['如何使用', '支持哪些系统'],
        askAiText: '询问 AI',
        searchText: '搜索',
        toSelectText: '选择',
        toNavigateText: '导航',
        toCloseText: '关闭',
        dictionary: {
            searchPlaceholder: '请输入要搜索的内容...',
            chatPlaceholder: '有什么可以帮你的吗？',
            noResultsFound: '未找到结果',
            noResultsFoundFor: '未找到与该内容相关的结果',
            suggestionsTitle: '建议',
            seeAll: '查看全部',
            addMore: '添加更多',
            clearChat: '清空聊天',
            errorMessage: '尝试搜索时发生错误。请重试。',
            disclaimer: 'AI 可能会出错，请核实信息。',
            startYourSearch: '开始搜索',
            initErrorSearch: '无法初始化搜索服务',
            initErrorChat: '无法初始化聊天服务',
            chatButtonLabel: '询问 AI',
            searchButtonLabel: '搜索',
        },
    },
    'zh-Hant': {
        suggestions: ['如何使用', '支援哪些系統'],
        askAiText: '詢問 AI',
        searchText: '搜尋',
        toSelectText: '選擇',
        toNavigateText: '導航',
        toCloseText: '關閉',
        dictionary: {
            searchPlaceholder: '請輸入要搜尋的內容...',
            chatPlaceholder: '有什麼可以幫你的嗎？',
            noResultsFound: '未找到結果',
            noResultsFoundFor: '未找到與該內容相關的結果',
            suggestionsTitle: '建議',
            seeAll: '看全部',
            addMore: '添加更多',
            clearChat: '清空聊天',
            errorMessage: '嘗試搜尋時發生錯誤。請重試。',
            disclaimer: 'AI 可能會出錯，請核實資訊。',
            startYourSearch: '開始搜尋',
            initErrorSearch: '無法初始化搜尋服務',
            initErrorChat: '無法初始化聊天服務',
            chatButtonLabel: '詢問 AI',
            searchButtonLabel: '搜尋',
        },
    },
    en: {
        suggestions: ['How to use', 'What systems are supported'],
        askAiText: 'Ask AI',
        searchText: 'Search',
        toSelectText: 'Select',
        toNavigateText: 'Navigate',
        toCloseText: 'Close',
        dictionary: {
            searchPlaceholder: 'Please enter the content to search...',
            chatPlaceholder: 'How can I help you?',
            noResultsFound: 'No results found',
            noResultsFoundFor: 'No results found for',
            suggestionsTitle: 'Suggestions',
            seeAll: 'See all',
            addMore: 'Add more',
            clearChat: 'Clear chat',
            errorMessage: 'An error occurred while trying to search. Please try again.',
            disclaimer: 'AI can make mistakes. Please verify the information.',
            startYourSearch: 'Start your search',
            initErrorSearch: 'Unable to initialize search service',
            initErrorChat: 'Unable to initialize chat service',
            chatButtonLabel: 'Ask AI',
            searchButtonLabel: 'Search',
        },
    },
}

// get search box config
function getOramaSearchBoxConfig() {
    const currentLang = __isZhHant ? 'zh-Hant' : __isEn ? 'en' : 'zh-Hans'
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
        suggestions: OramaI18nData[currentLang].suggestions,
        dictionary: OramaI18nData[currentLang].dictionary,
    }
}

// localization search box component
function localizationOramaSearchBox(searchBox) {
    if (!searchBox) return
    const currentLang = __isZhHant ? 'zh-Hant' : __isEn ? 'en' : 'zh-Hans'
    const askAiText = OramaI18nData[currentLang].askAiText
    const searchText = OramaI18nData[currentLang].searchText
    const observer = new MutationObserver((mutations, obs) => {
        const shadowRoot = searchBox.shadowRoot
        if (shadowRoot) {
            // Get a summary (Only PC)
            // const chatButton = shadowRoot.querySelector('.chat-button')
            // if (chatButton) {
            //     const element = chatButton.querySelector('.button-label')
            //     if (element && element.textContent !== askAiText) {
            //         element.textContent = askAiText
            //     }
            // }

            const footer = shadowRoot.querySelector('orama-footer')
            if (footer) {
                // Keyboard shortcuts localization (Only PC)
                const toSelectText = OramaI18nData[currentLang].toSelectText
                const toNavigateText = OramaI18nData[currentLang].toNavigateText
                const toCloseText = OramaI18nData[currentLang].toCloseText
                const shortcutDescriptions = footer.querySelectorAll('.shortcut-description')
                shortcutDescriptions.forEach((element) => {
                    if (element.textContent === 'to select' && element.textContent !== toSelectText) {
                        element.textContent = toSelectText
                    } else if (element.textContent === 'to navigate' && element.textContent !== toNavigateText) {
                        element.textContent = toNavigateText
                    } else if (element.textContent === 'to close' && element.textContent !== toCloseText) {
                        element.textContent = toCloseText
                    }
                })
                // Change logo image
                const logoImg = footer.querySelector('.logo-link .logo')
                if (logoImg) {
                    let theme = 'light'
                    try {
                        const palette = __md_get('__palette')
                        if (palette && typeof palette.color === 'object') {
                            theme = palette.color.scheme === 'slate' ? 'dark' : 'light'
                        }
                    } catch {}
                    logoImg.src = `/assets/images/icon/orama/orama-when-${theme}.svg`
                }
            }

            // Hide "Orama can make mistakes. Please verify the information."
            // const chatFormWrapper = shadowRoot.querySelector('.chat-form-wrapper')
            // if (chatFormWrapper) {
            //     const element = chatFormWrapper.querySelector('p.small.text-center')
            //     if (element) {
            //         element.style = 'display: none;'
            //     }
            // }

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
