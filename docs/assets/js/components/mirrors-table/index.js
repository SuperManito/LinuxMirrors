ComponentSystem.register('mirrors-table', {
    template: `
<div>
    <t-config-provider :global-config="globalConfig">
        <t-space v-if="!isMobile" align="center" style="margin-bottom: 8px; gap: 20px">
            <blockquote>
                <p>{{ startTitle[0] }} <code>Debian</code>、<code>Ubuntu</code>、<code>CentOS</code>、<code>openEuler</code> {{ startTitle[1] }}</p>
            </blockquote>
            <t-space style="width: 100%">
                <t-popup placement="bottom" :show-arrow="false">
                    <template #content>
                        <t-checkbox-group v-model="selectedCellStatuses" style="padding: 6px" @change="onCellStatusChange">
                            <t-space align="start" direction="vertical" style="gap: 4px">
                                <t-checkbox value="supported">
                                    <t-space align="center" style="gap: 2px">
                                        <t-tag theme="success" variant="light" style="background-color: transparent; vertical-align: -0.35em">
                                            <template #icon>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M21 7L9 19l-5.5-5.5l1.41-1.41L9 16.17L19.59 5.59L21 7Z"></svg>
                                            </template>
                                        </t-tag>
                                        <span>{{ statusLabels.supported }}</span>
                                    </t-space>
                                </t-checkbox>
                                <t-checkbox value="unsupported">
                                    <t-space align="center" style="gap: 0">
                                        <t-tag theme="danger" variant="light" style="background-color: transparent; vertical-align: -0.35em">
                                            <template #icon>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="vertical-align: -0.2em"><path fill="currentColor" d="M19 6.41L17.59 5L12 10.59L6.41 5L5 6.41L10.59 12L5 17.59L6.41 19L12 13.41L17.59 19L19 17.59L13.41 12L19 6.41Z"></svg>
                                            </template>
                                        </t-tag>
                                        <span>{{ statusLabels.unsupported }}</span>
                                    </t-space>
                                </t-checkbox>
                                <t-checkbox value="incompatible">
                                    <t-space align="center" style="gap: 2px">
                                        <t-tag theme="warning" variant="light" style="background-color: transparent; vertical-align: -0.35em">
                                            <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 2px" width="16" height="16" viewBox="0 0 24 24" style="vertical-align: -0.15em"><path fill="#F6B604" d="M22.11 21.46L2.39 1.73L1.11 3l2.95 2.95A9.95 9.95 0 0 0 2 12c0 5.5 4.5 10 10 10c2.28 0 4.37-.77 6.05-2.06l2.79 2.79l1.27-1.27M12 20c-4.42 0-8-3.58-8-8c0-1.73.56-3.32 1.5-4.62L16.62 18.5A7.78 7.78 0 0 1 12 20M8.17 4.97L6.72 3.5C8.25 2.56 10.06 2 12 2c5.5 0 10 4.5 10 10c0 1.94-.56 3.75-1.5 5.28l-1.47-1.45c.62-1.14.97-2.44.97-3.83c0-4.42-3.58-8-8-8c-1.39 0-2.69.35-3.83.97Z"></svg>
                                        </t-tag>
                                        <span>{{ statusLabels.incompatible }}</span>
                                    </t-space>
                                </t-checkbox>
                            </t-space>
                        </t-checkbox-group>
                    </template>
                    <t-button variant="text" shape="circle">
                        <svg fill="none" viewBox="0 0 24 24" width="1em" height="1em" class="t-icon t-icon-filter" style="fill: none;"><g id="filter"><path id="fill1" fill="transparent" d="M19.5 4H4.5L10.5 12.5V20H13.5V12.5L19.5 4Z" fill-rule="evenodd" clip-rule="evenodd"></path><path id="stroke1" stroke="currentColor" d="M19.5 4H4.5L10.5 12.5V20H13.5V12.5L19.5 4Z" fill-rule="evenodd" stroke-linecap="square" stroke-width="2" clip-rule="evenodd"></path></g></svg>
                    </t-button>
                </t-popup>
                <t-select
                    v-model="selectedRowFilters"
                    :options="rowFilterOptionsRendered"
                    :min-collapsed-num="1"
                    multiple
                    clearable
                    size="large"
                    :placeholder="rowSelectPlaceholder"
                    style="min-width: 160px; width: 250px"
                    @change="onRowFilterChange"
                />
                <t-select
                    v-model="selectedColumnFilters"
                    :options="filterOptions"
                    :min-collapsed-num="1"
                    multiple
                    clearable
                    size="large"
                    :placeholder="selectPlaceholder"
                    style="min-width: 160px; width: 230px"
                    @change="onFilterChange"
                />
            </div>
        </t-space>
        <blockquote v-if="isMobile">
            <p>{{ startTitle[0] }} <code>Debian</code>、<code>Ubuntu</code>、<code>CentOS</code>、<code>openEuler</code> {{ startTitle[1] }}</p>
        </blockquote>
        <t-table
            :columns="columns"
            :data="data"
            row-key="name"
            size="small"
            verticalAlign="bottom"
            hover
            @data-change="dataChange"
            @filter-change="onTableFilterChange"
        >
            <template v-for="col in columns" :key="col.colKey" #[col.colKey]="{ row }">
                <div v-if="col.colKey === 'name'">
                    <t-popup placement="bottom" :show-arrow="false">
                        <template #content>
                            <t-space direction="vertical" algin="center" style="gap: 2px">
                                <span>{{ row.officialName }}</span>
                                <a :href="row.url" target="_blank" rel="noopener noreferrer" style="color: var(--md-typeset-a-color)">{{ row.domain }}</a>
                            </t-space>
                        </template>
                        <a :href="row.url" target="_blank" rel="noopener noreferrer">
                            <t-space align="center" style="gap: 6px">
                                <span style="display: flex; height: 16px; width: 16px; align-items: center; justify-content: center">
                                    <img v-if="row.icon" :src="'/assets/images/icon/mirrors/' + row.icon" width="16" height="16">
                                </span>
                                <span style="display: flex; align-items: center; justify-content: center">{{ row.name }}</span>
                            </t-space>
                        </a>
                    </t-popup>
                </div>
                <div v-else>
                    <t-tag v-if="typeof row[col.colKey] === 'boolean'" :theme="row[col.colKey] ? 'success' : 'danger'" variant="light" size="small" style="background-color: transparent; height: 26px" style="z-index: 2">
                        <template #icon>
                            <div v-if="row[col.colKey] === true && !['ipv6'].includes(col.colKey) && showSupported">
                                <t-popup placement="bottom" :show-arrow="false">
                                    <template #content>
                                        <a :href="getMirrorSiteBranchUrl(row.domain, col.colKey)" target="_blank" rel="noopener noreferrer" style="color: var(--md-typeset-a-color)">{{ getMirrorSiteBranchUrl(row.domain, col.colKey) }}</a>
                                    </template>
                                    <a :href="getMirrorSiteBranchUrl(row.domain, col.colKey)" target="_blank" rel="noopener noreferrer" style="color: var(--td-success-color)">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M21 7L9 19l-5.5-5.5l1.41-1.41L9 16.17L19.59 5.59L21 7Z"></svg>
                                    </a>
                                </t-popup>
                            </div>                                               
                            <svg v-else-if="row[col.colKey] === true && showSupported" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M21 7L9 19l-5.5-5.5l1.41-1.41L9 16.17L19.59 5.59L21 7Z"></svg>
                            <svg v-else-if="row[col.colKey] === false && showUnsupported" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M19 6.41L17.59 5L12 10.59L6.41 5L5 6.41L10.59 12L5 17.59L6.41 19L12 13.41L17.59 19L19 17.59L13.41 12L19 6.41Z"></svg>
                        </template>
                    </t-tag>
                    <t-tag v-else theme="warning" variant="light" size="small" style="background-color: transparent; height: 26px">
                        <template #icon>
                            <svg v-if="showIncompatible" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"><path fill="#F6B604" d="M22.11 21.46L2.39 1.73L1.11 3l2.95 2.95A9.95 9.95 0 0 0 2 12c0 5.5 4.5 10 10 10c2.28 0 4.37-.77 6.05-2.06l2.79 2.79l1.27-1.27M12 20c-4.42 0-8-3.58-8-8c0-1.73.56-3.32 1.5-4.62L16.62 18.5A7.78 7.78 0 0 1 12 20M8.17 4.97L6.72 3.5C8.25 2.56 10.06 2 12 2c5.5 0 10 4.5 10 10c0 1.94-.56 3.75-1.5 5.28l-1.47-1.45c.62-1.14.97-2.44.97-3.83c0-4.42-3.58-8-8-8c-1.39 0-2.69.35-3.83.97Z"></svg>
                        </template>
                    </t-tag>
                </template>
            </template>
        </t-table>
    </t-config-provider>
</div>
`,
    data() {
        return {
            allColumns: mirrorsTableColumns,
            columns: mirrorsTableColumns,
            originalData: mirrorsTableData,
            data: mirrorsTableData.slice(),
            rawFilterOptions: mirrorsTableFilterSelectOptions,
            selectedColumnFilters: [],
            selectedRowFilters: [],
            selectedCellStatuses: ['supported', 'unsupported', 'incompatible'],
            activeTableFilters: {},
        }
    },
    created() {
        const allKeys = this._flattenFilterKeys(this.filterOptions)
        this.selectedColumnFilters = allKeys.slice()
        this.selectedRowFilters = Array.isArray(this.originalData) ? this.originalData.map((r) => r.name) : []
        this._debouncedUpdateColumns = debounce(this._updateColumns.bind(this), 120)
        this._debouncedUpdateRows = debounce(this._updateRows.bind(this), 120)
        this._updateColumns()
        this._updateRows()
    },
    computed: {
        isMobile() {
            return window.matchMedia('(max-width: 768px)').matches
        },
        localeFlags() {
            const p = (window && window.location && window.location.pathname) || ''
            return {
                isZhHant: p.includes('/zh-Hant'),
                isEn: p.includes('/en'),
            }
        },
        startTitle() {
            const f = this.localeFlags
            return f.isZhHant ? ['下方列表中的鏡像站均同步了', '軟體倉庫，列表根據單位性質、地理位置、名稱長度排序，與實際下載速度無關。'] : f.isEn ? ['All mirror sites in the list below synchronize the', 'software repositories. The list is sorted by institution type, geographic location, and name length, and is not related to actual download speed.'] : ['下方列表中的镜像站均同步了', '软件仓库，列表根据单位性质、地理位置、名称长度进行排序，与实际速度无关。']
        },
        globalConfig() {
            const f = this.localeFlags
            return {
                animation: { include: ['expand', 'fade'], exclude: [] },
                table: f.isZhHant
                    ? {
                          empty: '\u66AB\u7121\u6578\u64DA',
                          loadingText: '\u6B63\u5728\u8F09\u5165\u4E2D\uFF0C\u8ACB\u7A0D\u5F8C',
                          loadingMoreText: '\u9EDE\u64CA\u8F09\u5165\u66F4\u591A',
                          filterInputPlaceholder: '\u8ACB\u8F38\u5165\u5185\u5BB9\uFF08\u7121\u9ED8\u8A8D\u503C\uFF09',
                          sortAscendingOperationText: '\u9EDE\u64CA\u5347\u5E8F',
                          sortCancelOperationText: '\u9EDE\u64CA\u53D6\u6D88\u6392\u5E8F',
                          sortDescendingOperationText: '\u9EDE\u64CA\u964D\u5E8F',
                          clearFilterResultButtonText: '\u6E05\u7A7A\u7BE9\u9078',
                          columnConfigButtonText: '\u884C\u914D\u7F6E',
                          columnConfigTitleText: '\u8868\u683C\u884C\u914D\u7F6E',
                          columnConfigDescriptionText: '\u8ACB\u9078\u64C7\u9700\u8981\u5728\u8868\u683C\u4E2D\u986F\u793A\u7684\u6578\u64DA\u884C',
                          confirmText: '\u78BA\u8A8D',
                          cancelText: '\u53D6\u6D88',
                          resetText: '\u91CD\u7F6E',
                          selectAllText: '\u5168\u9078',
                          searchResultText: '\u641C\u5C0B"{result}"\uFF0C\u627E\u5230{count}\u9805\u7D50\u679C',
                      }
                    : f.isEn
                    ? {
                          empty: 'Empty Data',
                          loadingText: 'loading...',
                          loadingMoreText: 'loading more',
                          filterInputPlaceholder: '',
                          sortAscendingOperationText: 'click to sort ascending',
                          sortCancelOperationText: 'click to cancel sorting',
                          sortDescendingOperationText: 'click to sort descending',
                          clearFilterResultButtonText: 'Clear',
                          columnConfigButtonText: 'Column Config',
                          columnConfigTitleText: 'Table Column Config',
                          columnConfigDescriptionText: 'Please select columns to show them in the table',
                          confirmText: 'Confirm',
                          cancelText: 'Cancel',
                          resetText: 'Reset',
                          selectAllText: 'Select All',
                          searchResultText: 'Search "{result}". Found no items. | Search "{result}". Found 1 item. | Search "{result}". Found {count} items.',
                      }
                    : undefined,
                select: f.isZhHant
                    ? {
                          empty: '\u66AB\u7121\u6578\u64DA',
                          loadingText: '\u8F09\u5165\u4E2D',
                          placeholder: '\u8ACB\u9078\u64C7',
                      }
                    : f.isEn
                    ? {
                          empty: 'Empty Data',
                          loadingText: 'loading...',
                          placeholder: 'please select',
                      }
                    : undefined,
            }
        },
        selectPlaceholder() {
            const f = this.localeFlags
            return f.isZhHant ? '选择要显示的列' : f.isEn ? 'Select columns to show' : '选择要显示的列'
        },
        rowSelectPlaceholder() {
            const f = this.localeFlags
            return f.isZhHant ? '筛选显示的镜像' : f.isEn ? 'Filter mirrors to show' : '筛选显示的镜像'
        },
        rowFilterOptions() {
            const f = this.localeFlags
            const arr = Array.isArray(this.originalData) ? this.originalData.map((r) => ({ value: r.name, label: r.name, iconName: r.icon })) : []
            const head = { value: '__all__', label: f.isZhHant ? '全選' : f.isEn ? 'Select All' : '全选', checkAll: true }
            return [head].concat(arr)
        },
        rowFilterOptionsRendered() {
            return Array.isArray(this.rowFilterOptions) ? this.rowFilterOptions.map((o) => this._mapOptionForRow(o)) : []
        },
        statusLabels() {
            const f = this.localeFlags
            return {
                supported: f.isZhHant ? '支援' : f.isEn ? 'Supported' : '支持',
                unsupported: f.isZhHant ? '不支援' : f.isEn ? 'Unsupported' : '不支持',
                incompatible: f.isZhHant ? '不相容' : f.isEn ? 'Incompatible' : '不兼容',
            }
        },
        showSupported() {
            return Array.isArray(this.selectedCellStatuses) && this.selectedCellStatuses.includes('supported')
        },
        showUnsupported() {
            return Array.isArray(this.selectedCellStatuses) && this.selectedCellStatuses.includes('unsupported')
        },
        showIncompatible() {
            return Array.isArray(this.selectedCellStatuses) && this.selectedCellStatuses.includes('incompatible')
        },
        filterOptions() {
            return Array.isArray(this.rawFilterOptions) ? this.rawFilterOptions.map((o) => this._mapOptionForFilter(o)) : []
        },
    },
    methods: {
        dataChange(data) {
            try {
                const hasColumnFilters = this.activeTableFilters && Object.keys(this.activeTableFilters).length > 0
                const hasRowFilters = Array.isArray(this.selectedRowFilters) && this.selectedRowFilters.length > 0
                if (hasColumnFilters || hasRowFilters) {
                    return
                }
                this.data = data
            } catch {}
        },
        onFilterChange() {
            if (this._debouncedUpdateColumns) this._debouncedUpdateColumns()
            else this._updateColumns()
        },
        onRowFilterChange() {
            try {
                if (Array.isArray(this.selectedRowFilters) && this.selectedRowFilters.includes('__all__')) {
                    this.selectedRowFilters = Array.isArray(this.originalData) ? this.originalData.map((r) => r.name) : []
                }
            } catch {}
            if (this._debouncedUpdateRows) this._debouncedUpdateRows()
            else this._updateRows()
        },
        getMirrorSiteBranchUrl(domain, branchName) {
            return `https://${domain}/${branchName.replace(/_/, '-')}/`
        },
        _mapOptionForRow(opt) {
            const prefix = '/assets/images/icon/mirrors/'
            const copy = Object.assign({}, opt)
            if (copy.iconName) copy.prefixIcon = prefix + copy.iconName
            copy.content = function (h, ctx) {
                const option = (ctx && ctx.option) || copy
                const children = []
                if (option.iconName) {
                    children.push(h('img', { src: prefix + option.iconName, width: 16, height: 16, style: 'vertical-align: middle' }))
                }
                children.push(h('span', { style: option.iconName ? 'margin-left: 8px' : '' }, option.label || option.value || ''))
                return h('div', { style: 'display: flex; align-items: center' }, children)
            }
            return copy
        },
        _mapOptionForFilter(opt) {
            const prefix = '/assets/images/icon/'
            const copy = Object.assign({}, opt)
            if (copy.iconName) copy.prefixIcon = prefix + copy.iconName
            copy.content = function (h, ctx) {
                const option = (ctx && ctx.option) || copy
                const children = []
                if (option.iconName) {
                    children.push(h('img', { src: prefix + option.iconName, width: 16, height: 16, style: 'vertical-align: middle' }))
                }
                children.push(h('span', { style: option.iconName ? 'margin-left: 8px' : '' }, option.label || option.value || ''))
                return h('div', { style: 'display: flex; align-items: center' }, children)
            }
            if (Array.isArray(copy.children)) {
                copy.children = copy.children.map((c) => this._mapOptionForFilter(c))
            }
            return copy
        },
        onCellStatusChange() {
            if (this._debouncedUpdateRows) this._debouncedUpdateRows()
            else this._updateRows()
        },
        onTableFilterChange(filters) {
            try {
                this.activeTableFilters = filters || {}
                if (this._debouncedUpdateRows) this._debouncedUpdateRows()
                else this._updateRows()
            } catch {}
        },
        _updateColumns() {
            try {
                const keys = new Set(this.selectedColumnFilters || [])
                this.columns = this.allColumns.filter((col) => col.colKey === 'name' || keys.has(col.colKey))
            } catch (e) {
                this.columns = this.allColumns
            }
        },
        _updateRows() {
            try {
                this._computeFilteredData()
            } catch {}
        },
        _computeFilteredData() {
            try {
                let rows = Array.isArray(this.originalData) ? this.originalData.slice() : []
                if (Array.isArray(this.selectedRowFilters) && this.selectedRowFilters.length) {
                    const names = new Set(this.selectedRowFilters || [])
                    rows = rows.filter((r) => names.has(r.name))
                }
                const filters = this.activeTableFilters || {}
                const filterKeys = Object.keys(filters)
                if (filterKeys.length) {
                    rows = rows.filter((row) => {
                        for (let i = 0; i < filterKeys.length; i++) {
                            const key = filterKeys[i]
                            let value = filters[key]
                            if (Array.isArray(value)) value = value.length ? value[0] : undefined
                            if (!value) continue
                            const cell = Object.prototype.hasOwnProperty.call(row, key) ? row[key] : undefined
                            if (value === 'supported') {
                                if (cell !== true) return false
                            } else if (value === 'unsupported') {
                                if (cell !== false) return false
                            } else if (value === 'incompatible') {
                                if (cell !== 'incompatible') return false
                            } else {
                                continue
                            }
                        }
                        return true
                    })
                }
                this.data = rows
            } catch {}
        },
        _flattenFilterKeys(options) {
            const set = new Set()
            options.forEach((opt) => {
                if (opt.group && Array.isArray(opt.children)) {
                    opt.children.forEach((child) => {
                        if (child && child.value) set.add(child.value)
                    })
                } else if (Array.isArray(opt.children)) {
                    opt.children.forEach((child) => {
                        if (child && child.value) set.add(child.value)
                    })
                } else if (opt.value) {
                    set.add(opt.value)
                }
            })
            return Array.from(set)
        },
    },
})
