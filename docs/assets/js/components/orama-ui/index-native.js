function loadOramaWebComponent() {
    const searchBox = document.querySelector('orama-search-box')
    if (searchBox) {
        Object.assign(searchBox, getOramaSearchBoxConfig())
    }

    // custom entrance button style
    const searchButton = document.querySelector('orama-search-button')
    if (searchButton) {
        searchButton.textContent = '搜索'
        const observer = new MutationObserver((_mutations, obs) => {
            if (searchButton.shadowRoot) {
                const button = searchButton.shadowRoot.querySelector('button')
                if (button) {
                    button.style = 'border-radius: 8px !important;'
                    button.querySelector('.button__label').style = 'height: 22px; padding: 2px 8px; font-size: 0.75rem;'
                    button.querySelector('span[slot="adorment-end"], .kyb-shortcut').style = 'display: none;'
                    // search icon style
                    const magnifyingGlassShadowRoot = button.querySelector('ph-magnifying-glass').shadowRoot
                    const styleElement = document.createElement('style')
                    styleElement.textContent = `
svg {
    font-size: 24px;
}`
                    if (!magnifyingGlassShadowRoot.querySelector('style[data-custom="icon-style"]')) {
                        styleElement.setAttribute('data-custom', 'icon-style')
                        magnifyingGlassShadowRoot.appendChild(styleElement)
                    }
                    obs.disconnect()
                }
            }
        })
        observer.observe(searchButton, {
            childList: true,
            subtree: true,
            attributes: true,
            characterData: true,
        })
        setTimeout(() => observer.disconnect(), 2000)
    }

    searchButton.addEventListener('click', function () {
        const searchBox = document.querySelector('orama-search-box')
        // localization chat box component
        localizationOramaSearchBox(searchBox)
    })
}
