# Exercise 5 - Function Implemented as Stored Procedure

[![code](https://flat.badgen.net/badge/code/available/green?icon=github)](./code/)

In this exercise, we will create a service function which is implmented via a HANA SQLScript Stored Procedure.

## Exercise 5.1 Add Stored Procedure and Use it to Implement a CAP Function

1. In the **/db/src** folder create a new file named **sleep.hdbprocedure**. This is a very simple HANA Stored Procedure that calls the built-in SYNC library to put processing to sleep for 10 seconds. Its a nice tool to be able to test the impact of long running queries without actually putting unnecessary load on the system. </br>![sleep](images/sleep_procedure.png)

```SQL
PROCEDURE "sleep" ( )
   LANGUAGE SQLSCRIPT
   SQL SECURITY INVOKER
   READS SQL DATA AS
BEGIN USING SQLSCRIPT_SYNC as SyncLib;
 
call SyncLib:SLEEP_SECONDS(10);

END
```

2. Save. Run ```npm run build``` from the terminal. Although this new stored procedure isn't part of CAP, the build will still copy it into the **/gen/db** folder. </br>![Build with Procedure](images/build_contains_procedure.png)

3. Run ```npm run hana```.  Likewise the CDS deploy to HANA will also deploy native HANA artifacts as well. Not everything in your project has to be implemented via CAP. You can also mix in HANA native development as well.</br>![Deploy also works for HANA Native content](images/deploy_creates_procedure.png)

4. If you wish you can return to the Database Explorer. This new Procedure is there now and can be tested. <br>![View sleep in DB Explorer](images/test_sleep1.png)</br></br>![Test Run sleep](images/test_sleep2.png)

5. But now we want to to add this Procedure to the CAP service as a function.  Edit **/srv/cat-service.cds**. </br>Add: ```function sleep() returns Boolean;``` to the service defintion. This will expose an OData Function as part of the service interface. </br>![Add Function](images/add_function.png)

6. Just adding the function doesn't do anything.  We need to use the service handler exit in **cat-service.js** again to implement the call to the Stored Procedure.  This logic will implement the exit handler for this function which in turn uses the standard @sap/hdbext module to call the Stored Procedure from HANA. </br>![Call Stored Procedure](images/call_stored_procedure.png)

```JavaScript
    this.on('sleep', async () => {
        try {
            const db = await cds.connect.to('db')
            const dbClass = require("sap-hdbext-promisfied")
            let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
            const hdbext = require("@sap/hdbext")
            const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'sleep')
            const output = await dbConn.callProcedurePromisified(sp, [])
            console.log(output.results)
            return true
        } catch (error) {
            console.error(error)
            return false
        }
    })
```

7. But since we used two additional HANA modules in our code, we need to add those to our root **package.json**. Please add **sap-hdbext-promisfied** and **@sap/hdbext** as shown.</br>![Extend package.json](images/extend_package_json.png)

8. Save your open files and Run the ```npm install``` from the Terminal.

9. Run ```npm run build``` then ```npm start```.  The CAP preview UI doesn't list functions or actions, however. Just click on the **/catalog** link for the entire service </br>![Cick on Catalog](images/click_on_catalog.png)

10. Manually add **/sleep()** to the end of the URL. If it works correctly it should take 10 seconds to respond since the procedure is running a sleep operation for that long. </br>![Sleep Function](images/sleep_true.png)

## Summary

You've now added an OData function to your service layer which in turn is implemented as a HANA Stored Procedure

All Done - Congratulations you've completed this course workshop
