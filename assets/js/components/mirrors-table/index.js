ComponentSystem.register('mirrors-table', {
    template: `
        <div>
            <t-table
                :columns="columns"
                :data="data"
                row-key="name"
                size="small"
            >
                <template v-for="col in columns" :key="col.colKey" #[col.title]>
                    <div v-if="col.tooltip" class="t-table__th-cell-inner">
                        <t-space style="gap: 4px">
                            {{ col.title }}
                            <t-tooltip :content="col.tooltip" placement="bottom" :show-arrow="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><path fill="currentColor" d="M11.95 18q.525 0 .888-.363t.362-.887t-.362-.888t-.888-.362t-.887.363t-.363.887t.363.888t.887.362m.05 4q-2.075 0-3.9-.788t-3.175-2.137T2.788 15.9T2 12t.788-3.9t2.137-3.175T8.1 2.788T12 2t3.9.788t3.175 2.137T21.213 8.1T22 12t-.788 3.9t-2.137 3.175t-3.175 2.138T12 22m0-2q3.35 0 5.675-2.325T20 12t-2.325-5.675T12 4T6.325 6.325T4 12t2.325 5.675T12 20m.1-12.3q.625 0 1.088.4t.462 1q0 .55-.337.975t-.763.8q-.575.5-1.012 1.1t-.438 1.35q0 .35.263.588t.612.237q.375 0 .638-.25t.337-.625q.1-.525.45-.937t.75-.788q.575-.55.988-1.2t.412-1.45q0-1.275-1.037-2.087T12.1 6q-.95 0-1.812.4T8.975 7.625q-.175.3-.112.638t.337.512q.35.2.725.125t.625-.425q.275-.375.688-.575t.862-.2"/></svg>
                            </t-tooltip>
                        </t-space>
                    </div>
                    <div v-else class="t-table__th-cell-inner">{{ col.title }}</div>
                </template>
                <template v-for="col in columns" :key="col.colKey" #[col.colKey]="{ row }">
                    <template v-if="col.colKey === 'name'">
                        <t-popup placement="bottom" :show-arrow="false">
                            <template #content>
                                <a :href="row.url" target="_blank" style="color: var(--md-typeset-a-color)">{{ row.domain }}</a>
                            </template>
                            <a :href="row.url" target="_blank">{{ row.name }}</a>
                        </t-popup>
                    </template>
                    <template v-else>
                        <t-tag v-if="typeof row[col.colKey] === 'boolean'" :theme="row[col.colKey] ? 'success' : 'danger'" variant="light" size="small" style="background-color: transparent; height: 100%">
                            <template #icon>
                                <svg v-if="row[col.colKey]" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M21 7L9 19l-5.5-5.5l1.41-1.41L9 16.17L19.59 5.59L21 7Z" /></svg>
                                <svg v-else xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="vertical-align: -0.2em"><path fill="currentColor" d="M19 6.41L17.59 5L12 10.59L6.41 5L5 6.41L10.59 12L5 17.59L6.41 19L12 13.41L17.59 19L19 17.59L13.41 12L19 6.41Z"/></svg>
                            </template>
                        </t-tag>
                        <t-tag v-else theme="warning" variant="light" size="small" style="background-color: transparent">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" style="vertical-align: -0.3em"><path fill="#F6B604" d="M22.11 21.46L2.39 1.73L1.11 3l2.95 2.95A9.95 9.95 0 0 0 2 12c0 5.5 4.5 10 10 10c2.28 0 4.37-.77 6.05-2.06l2.79 2.79l1.27-1.27M12 20c-4.42 0-8-3.58-8-8c0-1.73.56-3.32 1.5-4.62L16.62 18.5A7.78 7.78 0 0 1 12 20M8.17 4.97L6.72 3.5C8.25 2.56 10.06 2 12 2c5.5 0 10 4.5 10 10c0 1.94-.56 3.75-1.5 5.28l-1.47-1.45c.62-1.14.97-2.44.97-3.83c0-4.42-3.58-8-8-8c-1.39 0-2.69.35-3.83.97Z"/></svg>
                        </t-tag>
                    </template>
                </template>
            </t-table>
        </div>
    `,
    data() {
        return {
            columns: mirrorsTableColumns,
            data: mirrorsTableData,
        }
    },
})
