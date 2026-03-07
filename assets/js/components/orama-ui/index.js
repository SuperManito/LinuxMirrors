function loadOramaWebComponent() {
    const searchBox = document.querySelector('orama-search-box')
    if (searchBox) {
        Object.assign(searchBox, getOramaSearchBoxConfig())
    }

    // define global function
    window.openOramaSearch = function (event) {
        const element = document.querySelector('orama-search-box')
        if (element) {
            element.open = true
            localizationOramaSearchBox(element)
        }
        return false
    }
    // localization chat box component
    if (searchBox) {
        const openObserver = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'open' && searchBox.hasAttribute('open')) {
                    localizationOramaSearchBox(searchBox)
                }
            })
        })
        openObserver.observe(searchBox, { attributes: true })
        if (searchBox.hasAttribute('open')) {
            localizationOramaSearchBox(searchBox)
        }
    }
}
