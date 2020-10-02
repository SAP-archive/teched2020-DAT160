# Exercise 3 - Service Layer

[![code](https://flat.badgen.net/badge/code/available/green?icon=github)](./code/)

In this exercise, we will create...

## Exercise 3.1 Create Service

After completing these steps you will have created...

1. Edit /srv/cat-service.cds. Expose Purchase Order Headers and Items

```cds
using teched.PurchaseOrder as PO from '../db/data-model';

service CatalogService {
    entity POHeaders @(
        title               : '{i18n>poService}',
        odata.draft.enabled : true
    ) as projection on PO.Headers;

    entity POItems @(
        title               : '{i18n>poService}',
    ) as projection on PO.Items;
}
```

2. Save, build ```npm run build``` and deploy to HANA ```npm run hana```.  We have to deploy to HANA even though we didn't change the data model becuase service entities generate views

3. Run ```npm start``` uses the start srcipt which is ```cds run``` </br>![cds run](images/cds_run.png)

4. Click the ***Expose and Open***

5. Asked if you want to added a descirption </br>![describe port](images/expose_description.png)

6. You will recieve a message that the port 4004 which CDS runs on has been exposed and a new browser tab should open with the CDS explorer page.</br>![Port Exposed](images/port_exposed.png)

7. If you accidentally close the other tab or just want an overview of all running and exposed ports you can use the Ports:Preview and relaunch from the results</br>![Ports:Preview](images/ports_preview.png)

8. Initial preview - notice Currencies although we didn't expose it in the service layer </br>![CDS Preview](images/cds_preview.png)

9. metadata ![metadata](images/metadata1.png)

10. metadata annotations ![Metadata Annotations](images/metadata_annotations.png)

11. Currencies ![Currencies](images/currencies.png)

12. Change Browser language ![Change Browser Language](images/change_browser_lang.png)

13. Currencies description changed ![Currencies Description now in German](images/currencies_german_desc.png)

14. Feel free to test PO and Items.  Try some of the OData url parameters like **$top=2** ![PO with Top 2](images/po_with_top_2.png)

15. Fiori Preview ![Goto Fiori Preveiw](images/goto_fiori_preview.png)

16. Not enough annotations yet. We will add those in Exercise 4 ![Fiori Preview](images/fiori_preview_running.png)

17. Return to Editor. Can use **CTRL+C** to stop run. Also can use ```cds watch``` ![Stop Running](images/stop_running_service.png)

## Exercise 3.2 Add OData V2 Support

After completing these steps you will have...

1. package.json dependency to "@sap/cds-odata-v2-adapter-proxy" </br>![Package Dependency](images/package_json_odatav2.png)

2. Save and Run ```npm install```

3. Create new file in /srv named server.js - this is a special named file which CAP will use automatically as a custom boostrap </br>![Create server.js](images/create_server_js.png)

4. Coding for server.js - explain

```javascript
const cds = require('@sap/cds')
const proxy = require('@sap/cds-odata-v2-adapter-proxy')

cds.on('bootstrap', app => app.use(proxy()))
module.exports = cds.server
```

5. Save - ```npm start```  Notice Log </br>![Log Proxy Created](images/log_proxy_created.png)

6. Open Preview - no entries shown for the V2 version. </br> ![Preveiw no V2](images/preview_no_v2.png)

7. But if you open the entity in the preview and manually add /v2/ into the URL you will see the resutls change</br>![Manually Change URL](images/currencies_v2.png)

8. The same can be done for the **metadata** call</br>![V2 Metadata](images/metadata_v2.png)

## Exercise 3.3 Custom Handlers

After completing these steps you will have...

1. Create file named cat-service.js - name must match cat-service.cds. </br>![cat-service.js](images/cat_service_js.png)

2. Add coding for after read to log each reach -- special processing for the each action

```JavaScript
const cds = require('@sap/cds')
module.exports = cds.service.impl(function () {
    const { POHeaders } = this.entities()

    this.after('each', POHeaders, row =>{
        console.log(`Read PO: ${row.ID}`)
    })
})
```

3. Save. ```npm run build```, ```npm start```.  Log shows the new service implementation file </br>![Log with Exit Handler](images/log_with_exit_handler.png)

4. Run the PO Header request with the top=2 parameter to only read two records. </br>![Run PO with top 2 again](images/read_po_with_top_2_again.png)

5. See those two reads each logged. <br>![Console Log POs Read](images/console_log_for_pos_read.png)

6. Return to cat-service.js. Make it more interesting.  Add logic to raise a message on the message bus every time a PO Header is Created, Updated, or Deleted

```JavaScript
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
```

7. Will be able to test that later once we have a better UI

## Summary

You've now ...

Continue to - [Exercise 4 - User Interface](../ex4/README.md)