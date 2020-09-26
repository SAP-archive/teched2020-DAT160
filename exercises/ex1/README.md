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

```JSON
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

```JSON
    "scripts": {
        "hana": "cds deploy --to hana:dat160 --auto-undeploy",
        "start": "cds run",
        "build": "cds build/all --clean"
    },
```


## Summary

You've now ...

Continue to - [Exercise 2 - Exercise 2 Description](../ex2/README.md)

