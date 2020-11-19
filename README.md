# DAT160 - Cloud Native Development with SAP HANA

[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/teched2020-DEV160)](https://api.reuse.software/info/github.com/SAP-samples/teched2020-DEV160)

## Description

This repository contains the material for the SAP TechEd 2020 session called DAT160 - Cloud-Native Development with SAP HANA.

## Overview

Learn the basics of developing with SAP HANA Cloud combined with other cloud native frameworks and tools. During this session, we discuss how to use the latest capabilities of SAP Cloud Application Programming Model and SAP Business Application Studio to perform state-of-the-art development with SAP HANA.

## Requirements

* Get a Free Trial Account on SAP Cloud Platform (if you don't already have one): 
  * [video](https://youtu.be/n5luSQKYvQQ) 
  * [tutorial](https://developers.sap.com/tutorials/hcp-create-trial-account.html) 

* Set Up SAP Business Application Studio for development (if you've never used Business Application Studio): 
  * [video](https://youtu.be/WW6z4AnYriw)
  * [tutorial](https://developers.sap.com/tutorials/appstudio-onboarding.html) 

* Create an instance of the SAP HANA Cloud in your trial account (if you don't already have an instance):
  * [video](https://youtu.be/Lv_40d1ZtsM)
  * [tutorial](https://developers.sap.com/tutorials/hana-trial-advanced-analytics.html#b2b892a4-5efa-4498-854d-b8b1417a455a) - ONLY Step 3 is required
  * Please make sure, in the "Advanced Settings" part of the wizard, that you select "Allow all IP addresses" in the "Allowed connections" setting. 

## Exercises

[YouTube Playlist With All Exercises](https://www.youtube.com/playlist?list=PL6RpkC85SLQALP9z-q5-vNBFNIy1EEc1q)

* [Getting Started](exercises/ex0/)
  * [Is HANA running?](exercises/ex0#is-hana-running)
  * [Creating Business Application Studio Dev Space](exercises/ex0#creating-business-application-studio-dev-space)
  * [Configuring Business Application Studio Dev Space](exercises/ex0#configuring-business-application-studio-dev-space)
* [Exercise 1 - Create CAP Project](exercises/ex1/)
  * [Exercise 1.1 - Create Project From Template](exercises/ex1#exercise-11-create-project-from-template)
  * [Exercise 1.2 - Adjust package.json](exercises/ex1#exercise-12-adjust-packagejson)
  * [Exercise 1.3 - Build Sample Project Into HANA](exercises/ex1#exercise-13-build-sample-project-into-hana)
* [Exercise 2 - Building the Data Model](exercises/ex2/)
  * [Exercise 2.1 - Cleanup and Preparations for New Data Model](exercises/ex2#exercise-21-cleanup-and-preparations-fo-new-data-model)
  * [Exercise 2.2 - Create Data Model](exercises/ex2#exercise-22-create-data-model)
  * [Exercise 2.3 - Load Initial Data From CSV](exercises/ex2#exercise-23-load-initial-data-from-csv)
* [Exercise 3 - Service Layer](exercises/ex3/)
  * [Exercise 3.1 - Create Service](exercises/ex3#exercise-31-create-service)
  * [Exercise 3.2 - Add OData V2 Support](exercises/ex3#exercise-32-add-odata-v2-support)
  * [Exercise 3.3 - Custom Handlers](exercises/ex3#exercise-33-custom-handlers)
* [Exercise 4 - User Interface](exercises/ex4/)
  * [Exercise 4.1 - Add Fiori Annotations](exercises/ex4#exercise-41-add-fiori-annotations)
  * [Exercise 4.2 - Setup a Fiori Launchpad Sandbox](exercises/ex4#exercise-42-setup-a-fiori-launchpad-sandbox)
  * [Exercise 4.3 - Generate a Fiori Application](exercises/ex4#exercise-43-generate-a-fiori-application)
* [Exercise 5 - Function Implemented as Stored Procedure](exercises/ex5/)
  * [Exercise 5.1 - Add Stored Procedure and Use it to Implement a CAP Function](exercises/ex5#exercise-51-add-stored-procedure-and-use-it-to-implement-a-cap-function)

## How to obtain support

Support for the content in this repository is available during the actual time of the online session for which this content has been designed. Otherwise, you may request support via the [Issues](../../issues) tab.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
