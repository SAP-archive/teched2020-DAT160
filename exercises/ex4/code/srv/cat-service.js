const cds = require('@sap/cds')
module.exports = cds.service.impl(function () {

    const { POHeaders } = this.entities()

    this.after('each', POHeaders, row =>{
        console.log(`Read PO: ${row.ID}`)
    })

    this.after(['CREATE', 'UPDATE', 'DELETE'], [POHeaders], async (po, req) => {
        const header = req.data
        req.on('succeeded', () => {
            global.it || console.log(`< emitting: poChanged ${header.ID}`)
            this.emit('poChange', header)
        })
    })
})