# Final project for ITF Manual Testing Course

The scope of the final project for ITF Manual Testing Course is to use all gained knowledge throught the course and apply them in practice, using a live application.

Application under test: [https://opensource-demo.orangehrmlive.com/](https://opensource-demo.orangehrmlive.com/)

API Documentation: [https://orangehrm.github.io/orangehrm-api-doc/](https://orangehrm.github.io/orangehrm-api-doc/)

The final project will be split into 2 sections: [Testing section](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/README.md) and [SQL section](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/README.md).

Tools used: JIRA, Zephyr Squad, Postman, MySQL.

# Functional specifications

1. User Story - User Management Module

![UserStory1](https://user-images.githubusercontent.com/110056890/181301603-fcc322e7-7c75-468c-8a03-0ae87fbcf05a.png)

2. User Story - Job Module

![UserStory2](https://user-images.githubusercontent.com/110056890/181302168-d61ca487-7c2d-452c-a52e-fb23c56b5200.png)

3. User Story - UI 

![UserStory3](https://user-images.githubusercontent.com/110056890/181302276-abe83af7-7b13-4829-ad1e-98b1eef9407e.png)

# 1 Testing section

## 1.1 Test Planning

The Test Plan is designed to describe all details of testing for the Admin module from the OrangeHRM application.

The plan identifies the items to be tested, the features to be tested, the types of testing to be performed, the personnel responsible for testing, the resources and schedule required to complete testing, and the risks associated with the plan.

### 1.1.1 Roles assigned to the project and persons allocated

- Project manager – Pop Ioan
- Product Owner – Popovici Ioana
- Developer – Popescu Ilie
- QA Tester – Burz Maria

### 1.1.2 Entry criteria defined

-	Requirements are approved;
-	The code is ready to be tested;
-	Test cases are defined;
-	Test environment and all the necessary resources are prepared.

### 1.1.3 Exit criteria defined

-	Budget depleted or deadlines meet;
-	Execution of all test cases;
-	All the identified defects are corrected and closed;
-	No critical bug is left out. 

### 1.1.4 Test scope

Tests in scope: All the features of User Management submenu and Job submenu from Admin Module which were defined in the business requirements and specifications need to be tested: functional testing, GUI testing and API testing, compatibility testing with multiple browsers.

Tests not in scope: performance testing, integration testing of the Admin Module to other modules.

### 1.1.5 Risks detected

Project risks: lack of experience of the QA team, short deadline of Zephyr Squad trial, unavailability of test environment;

Product risks: validation constraints on the fields might be too restrictive to the end-user.

### 1.1.6 Evaluating entry criteria

The entry criterias defined in the Test Planning phase have been achieved and the test process can continue.

## 1.2 Test Monitoring and Control

Multiple reports were generated. The following report was generated to reflect the current status of the testing process, in case of major problems control measures could be taken. The following status report reflects the proportion of the passed and failed tests. 

![JIRAReport_OrangeHRM](https://user-images.githubusercontent.com/110056890/181923881-80af38b3-eb28-4b27-9f83-6545fa3bbe7c.png)

## 1.3 Test Analysis

### Business Requirements Review - Admin Module “User Management” and “Job”

-	The color of the “Cancel” button seems to be disabled;
-	The “delete” button appears to be active even though we didn’t check a box next to the “Username”;
-	The Figure 1.5. "Job Title List" is not complete, and we cannot see if the filter exists to “Job Description”. Also, in this picture, the “Job Specification” and “Note” fields are missing.
-	There is no specification about what kind of document the users can upload by clicking the “Browse” button from “Add Job title” window; 
-	The maximum number of characters from “Note” is not specified; 
-	On the “Pay grade” module, there is no consistency between screenshots. Figure 1.7 has defined a level 3 grade with minimum and maximum salary, below on figure 1.8 there is defined a level 1 grade with the same minimum and maximum salary. 
-	The open windows with clear demarcation of different sections and different actions to be make, doesn’t give us a user friendly interface;
-	On the “Work Shift” module, if we want to add a new work shift, we should have work hours “from hour” “to hour”;

### Test Conditions
The testing process will be executed based on the above requirements for the Admin Module. The following test conditions were found:

* Enter data only for mandatory fields and check that the user is created;
* Leave mandatory fields empty and check that the user cannot be created;
* Upload file that is larger that the allowed size; 
* Checking that the app meets the specification from business requirements;
* View the color and format of the buttons;
* View the page at a different resolution.

## 1.4 Test Design

Functional test cases were created in Zephyr Squad. Based on the analysis of the specifications, the test design techniques used for generating test cases are: static analysis (informal reviews), dynamic (equivalence partitioning, specification-based, state transition).  

Test cases:

![JIRA_TestCasesSummary](https://user-images.githubusercontent.com/110056890/181916126-f5345666-8abb-44c1-8026-e5c0c06e5d97.png)

The test cases with steps can be viewed here: [JIRA_TestCases.pdf](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/JIRA_OrangeHRMTestCases.pdf)

For the OrangeHRM API, the following checklist was generated: 

![PostmanSummary1](https://user-images.githubusercontent.com/110056890/181925221-7aacd662-608d-4539-8a6f-1ca75ad551c8.png)
![PostmanSummary2](https://user-images.githubusercontent.com/110056890/181925518-ca1abb4c-ffdd-4017-b0d9-45235cf65969.png)

## 1.5 Test Implementation

* Testing environment is up and running: [https://opensource-demo.orangehrmlive.com/](https://opensource-demo.orangehrmlive.com/)
* Access to the testing environment is given: Username : Admin | Password : admin123;
* Cycle summary was created;
* Test cases were added to the cycle summary;
* Postman collection with the dependents API methods was created;
* Authorization token was created for accessing the API.

## 1.6 Test Execution

Test cases are executed on the created test Cycle summary: [UserManagementModule] (), [JobModule](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/JIRA_CycleSummary_JobModule.pdf), [UserInteraction](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/JIRA_CycleSummary_UserInteraction.pdf)

Bugs have been created based on the failed tests. The complete bug reports can be found here: [Admin_Module_Bugs](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/Traceability_Matrix_Bugs.pdf)

API tests are executed based on the checklist. The test cases with the end-points and requests can be seen here: [PostmanAPI_End-Points&Requests&TestCases](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/OrangeHRM.postman_API_End-points.pdf) 
The collection used can be found here: [JSON file](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/orangeHRM.postman_test_run.json) with the collection of requests created for the OrangeHRM API.
The results of the test in Postman can be seen here: [Tests_Results_Postman](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/Postman_TestResults.pdf)

## 1.7 Test Completion

![TracebilityMatrix_UserManagementModule](https://user-images.githubusercontent.com/110056890/181340178-b447195e-48e7-47da-9671-e6958d47d526.png)

![TracebilityMatrix_JobModule](https://user-images.githubusercontent.com/110056890/181340216-8688ca18-28e6-4ac4-a349-d7d6d202fe06.png)

![TracebilityMatrix_UserInteraction](https://user-images.githubusercontent.com/110056890/181340251-32b93998-3991-4faa-ba69-822f503e7f3e.png)

Exit criteria was evaluated and a couple of bugs are in progress.

The traceability matrix was generated and can be found here: [Traceability_matrix](https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/Traceability_Matrix.pdf)

Test execution chart was generated, the final report shows:

![JIRAReport](https://user-images.githubusercontent.com/110056890/181923678-7698a0ee-505d-43d8-aefe-6b900823669a.png)

A number of 18 test cases were planned for execution and all of them were executed.

Test execution chart was generated and the final report shows that a number of 6 tests have failed of a total of 18.
Thereby, a number of 6 total bugs were found, from which the priority is as follow: 1 is highest, 3 are medium and 2 are low.

![Bugs](https://user-images.githubusercontent.com/110056890/181924498-d10803f7-7677-42aa-a73f-28151c192150.png)

As the Exit criteria were not met and satisfied, IT is suggested to go back to the development team and prioritise the remaining 'in progress' bugs, then schedule the tests in question to be tested by the Testing team.

# 2 SQL section

In this section I've created a database named 'orangehrm' and  3 tables named 'users', 'job' and 'grade' with all the columns needed to save data per specifications. I've performed different queries inside the sql file: [orangeHRMDatabase.sql] (https://github.com/MariaBurz/manual_testing_portofolio/blob/main/Final_Project/OrangeHRM.sql)
