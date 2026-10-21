function loadAlgoliaSearchComponent() {
    SiteSearchAskAI.init(getAlgoliaSearchConfig())

    // SiteSearch uses 'modal-backdrop', SiteSearchAskAI uses 'modal-backdrop-askai'
    const bodyObserver = new MutationObserver((mutations) => {
        for (const mutation of mutations) {
            for (const node of mutation.addedNodes) {
                if (
                    node.nodeType === Node.ELEMENT_NODE &&
                    Array.from(node.classList).some((c) => c.startsWith('modal-backdrop'))
                ) {
                    localizationAlgoliaSearchModal(node)
                }
            }
        }
    })
    bodyObserver.observe(document.body, { childList: true })
}

// Idempotent patch: can be called repeatedly as the modal DOM changes.
function patchAlgoliaModal(modal, i18n) {
    // -- Search mode --

    // "Clear" button
    const clearBtn = modal.querySelector('.ss-search-clear-button')
    if (clearBtn && clearBtn.textContent.trim() === 'Clear') {
        clearBtn.textContent = i18n.clearText
    }

    // Footer kbd groups: first = "Open", second = "Navigate"
    const kbdGroups = modal.querySelectorAll('.ss-footer-kbd-group')
    kbdGroups.forEach((group) => {
        const span = group.querySelector('span')
        if (!span) return
        if (span.textContent.trim() === 'Open') {
            span.textContent = i18n.openText
        } else if (span.textContent.trim() === 'Navigate') {
            span.textContent = i18n.navigateText
        }
    })

    // "Ask AI" entry in hits list: <article class="ss-ask-ai-btn">
    const askAiArticle = modal.querySelector('.ss-ask-ai-btn')
    if (askAiArticle) {
        const titleP = askAiArticle.querySelector('.ss-infinite-hits-item-title')
        if (titleP) {
            const firstText = titleP.childNodes[0]
            if (firstText && firstText.nodeType === Node.TEXT_NODE && firstText.textContent.startsWith('Ask AI')) {
                firstText.textContent = i18n.askAiText + ': '
            }
        }
        if (askAiArticle.getAttribute('aria-label') === 'Ask AI') askAiArticle.setAttribute('aria-label', i18n.askAiText)
        if (askAiArticle.getAttribute('title') === 'Ask AI') askAiArticle.setAttribute('title', i18n.askAiText)
    }

    // -- Chat (Ask AI) mode --

    // Input placeholder: "Ask AI anything"
    const chatInput = modal.querySelector('.ss-searchbox-form--chat input')
    if (chatInput && chatInput.placeholder === 'Ask AI anything') {
        chatInput.placeholder = i18n.askAiPlaceholder
    }

    // "Back to search" button
    const backBtn = modal.querySelector('.ss-search-left-button')
    if (backBtn && backBtn.getAttribute('title') === 'Back to search') {
        backBtn.setAttribute('title', i18n.backToSearch)
        backBtn.setAttribute('aria-label', i18n.backToSearch)
    }

    // "New conversation" button
    const newChatBtn = modal.querySelector('.ss-search-new-chat-button')
    if (newChatBtn && newChatBtn.getAttribute('title') === 'New conversation') {
        newChatBtn.setAttribute('title', i18n.newConversation)
        newChatBtn.setAttribute('aria-label', i18n.newConversation)
    }

    // "Answers are generated with AI which can make mistakes."
    const hint = modal.querySelector('.ss-hint')
    if (hint && hint.textContent.trim() === 'Answers are generated with AI which can make mistakes.') {
        hint.textContent = i18n.aiDisclaimer
    }

    // Per-card actions: Like / Dislike / Copy answer
    modal.querySelectorAll('.ss-qa-action-btn').forEach((btn) => {
        const t = btn.getAttribute('title')
        if (t === 'Like') {
            btn.setAttribute('title', i18n.likeText)
            btn.setAttribute('aria-label', i18n.likeText)
        } else if (t === 'Dislike') {
            btn.setAttribute('title', i18n.dislikeText)
            btn.setAttribute('aria-label', i18n.dislikeText)
        } else if (t === 'Copy answer') {
            btn.setAttribute('title', i18n.copyAnswer)
            btn.setAttribute('aria-label', i18n.copyAnswer)
        }
    })
}

function localizationAlgoliaSearchModal(modal) {
    const lang = getAlgoliaCurrentLang()
    if (lang === 'en') return

    const i18n = AlgoliaI18nData[lang]

    // Keep observer alive for the full modal lifetime so dynamic chat
    // content (new QA cards, panel switches) is always patched.
    const observer = new MutationObserver(() => patchAlgoliaModal(modal, i18n))
    observer.observe(modal, { childList: true, subtree: true })

    // Disconnect when the modal is removed from the DOM.
    const cleanup = new MutationObserver((mutations) => {
        for (const m of mutations) {
            for (const node of m.removedNodes) {
                if (node === modal) {
                    observer.disconnect()
                    cleanup.disconnect()
                }
            }
        }
    })
    cleanup.observe(document.body, { childList: true })
}
