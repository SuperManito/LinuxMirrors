const AlgoliaI18nData = {
    'zh-Hans': {
        askAiText: '询问 AI',
        clearText: '清空',
        openText: '打开',
        navigateText: '导航',
        placeholder: '请输入要搜索的内容',
        askAiPlaceholder: '询问 AI 任何问题',
        aiDisclaimer: 'AI 可能不准确，请核实答案。',
        newConversation: '新对话',
        backToSearch: '返回搜索',
        likeText: '有帮助',
        dislikeText: '没帮助',
        copyAnswer: '复制',
    },
    'zh-Hant': {
        askAiText: '詢問 AI',
        clearText: '清空',
        openText: '打開',
        navigateText: '導航',
        placeholder: '請輸入要搜索的內容',
        askAiPlaceholder: '詢問 AI 任何問題',
        aiDisclaimer: 'AI 可能不準確，請查證答案。',
        newConversation: '新對話',
        backToSearch: '返回搜尋',
        likeText: '有幫助',
        dislikeText: '沒幫助',
        copyAnswer: '複製',
    },
    en: {
        askAiText: 'Ask AI',
        clearText: 'Clear',
        openText: 'Open',
        navigateText: 'Navigate',
        placeholder: 'Enter your search query',
        askAiPlaceholder: 'Ask AI anything',
        aiDisclaimer: 'Answers are generated with AI which can make mistakes.',
        newConversation: 'New conversation',
        backToSearch: 'Back to search',
        likeText: 'Like',
        dislikeText: 'Dislike',
        copyAnswer: 'Copy',
    },
}

function getAlgoliaCurrentLang() {
    return __isZhHant ? 'zh-Hant' : __isEn ? 'en' : 'zh-Hans'
}

function getAlgoliaSearchConfig() {
    const lang = getAlgoliaCurrentLang()
    const scheme = document.querySelector('[data-md-color-scheme]')?.getAttribute('data-md-color-scheme')
    const isDarkMode = scheme === 'slate' || scheme === 'dark'
    return {
        container: '#search-container',
        applicationId: 'EQO6IPTEY8',
        apiKey: '353d0a78521edc905d38a27d479bc2ec',
        indexName: 'docs',
        assistantId: '967fa671-8a15-46d8-83cd-095bb3e3619a',
        agentStudio: true,
        darkMode: isDarkMode,
        placeholder: AlgoliaI18nData[lang].placeholder,
        attributes: {
            primaryText: 'title',
            secondaryText: 'content',
            url: 'url',
        },
        transformItems: (items) => {
            let result
            if (lang === 'zh-Hant') {
                result = items.filter((item) => item.url.includes('/zh-Hant/'))
            } else if (lang === 'en') {
                result = items.filter((item) => item.url.includes('/en/'))
            } else {
                result = items.filter((item) => !item.url.includes('/en/') && !item.url.includes('/zh-Hant/'))
            }
            return result.map((item) => {
                const type = item.type
                const hlEntry = (type && item._highlightResult?.hierarchy?.[type]) || item._highlightResult?.hierarchy?.lvl2 || item._highlightResult?.hierarchy?.lvl1 || item._highlightResult?.hierarchy?.lvl0
                const plainText = (type && item.hierarchy?.[type]) || item.hierarchy?.lvl2 || item.hierarchy?.lvl1 || item.hierarchy?.lvl0 || ''
                const aisValue = hlEntry ? hlEntry.value.replace(/<span class="algolia-docsearch-suggestion--highlight">(.*?)<\/span>/g, '__ais-highlight__$1__/ais-highlight__') : plainText
                return {
                    ...item,
                    title: plainText,
                    _highlightResult: {
                        ...item._highlightResult,
                        title: {
                            value: aisValue,
                            matchLevel: hlEntry?.matchLevel || 'none',
                            matchedWords: hlEntry?.matchedWords || [],
                        },
                    },
                }
            })
        },
        insights: false,
    }
}
