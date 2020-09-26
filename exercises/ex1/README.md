# Exercise 1 - Create CAP Project

In this exercise, we will create...

## Exercise 1.1 Create Project From Template

After completing these steps you will have created...

1. Click **Create project from template** </br>![Create project from template](images/create_project_from_template.png)

2. Choose **@sap/cap Project** as the template. Keep the target folder path at the default value. Press **Next**</br>![Choose @sap/cap Project](images/choose_cap_project.png)

3. </br>![Project Details](images/project_details.png)

4. </br>![Project Generate](images/project_generated.png)

5. </br>![Project Review](images/new_cap_project_review.png)

## Exercise 1.2 Adjust package.json

After completing these steps you will have...

1. </br>![package.json HANA Client update](images/package_json_hana_client.png)

2. cds section of package.json add hana.deploy-format

```json
"cds": {
        "hana": {
            "deploy-format": "hdbtable"
        },
        "requires": {
            "db": {
                "kind": "hana"
            }
        }
    }  
```

3. scripts section

```json
    "scripts": {
        "hana": "cds deploy --to hana:dat160 --auto-undeploy",
        "start": "cds run",
        "build": "cds build/all --clean"
    },
```

4. Complete package.json</br>![Complete package.json](images/complete_package_json.png)

5. New terminal</br>![New Terminal](images/new_terminal.png)

6. npm install

```shell
npm install
```

![npm install](images/npm_install.png)

## Exercise 1.3 Build Sample Project Into HANA

After completing these steps you will have created...

1. Run build command

```shell
npm run build
```

2. What build did</br>![CDS Build Results](images/cds_build.png)

3. gen folder</br>![Build Creates gen Folder](images/gen_folder.png)

4. Run deploy to

```shell
npm run hana
```

5. Results of deploy to</br>![Results of HANA Deployment](images/hana_deploy_results.png)

6. Install hana-cli

```shell
npm install -g hana-cli
```

![Install hana-cli](images/install_hana_cli.png)

7. hana-cli uses default-env.json created by the cds deploy to command. Can use that to connect to the HANA DB </br>![hana-cli systemInfo](images/hana_cli_systemInfo.png)

8. Or to the specific HDI container that was created for the CAP project</br>![hana-cli tables](images/hana_cli_tables.png)

9. Open Database Explorer</br>![Open Database Explorer](images/open_db_explorer.png)

10. Database Explorer initially empty</br>![Initial DB Explorer](images/initial_db_explorer.png)

11. Add Database</br>![Add Database](images/dbexplorer_add_database.png)

12. One sample table</br>![DB Explorer Tables](images/dbexplorer_tables.png)

13. View Data</br>![DB Explorer View Data](images/dbexplorer_view_data.png)

## Summary

You've now ...

Continue to - [Exercise 2 - Exercise 2 Description](../ex2/README.md)

