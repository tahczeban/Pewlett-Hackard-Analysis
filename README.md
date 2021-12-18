# Pewlett-Hackard-Analysis

***RESOURCES***

Pandas, Jupyter notebook, matplotlib, Python, NumPy, PostgreSQL/PGadmin

***OVERVIEW***

The purpose of this project was to convert large CSV files, create database designs/entity relationship diagrams (ERD's), designe/manage tables and write SQL statements for Pewlett_Hackard in order to help them determine the "silver tsunami" of employees who are about to retire. Bobby, an HR analyst for Pewlett_Hackard, would specifically like to know how many retiring employees per title who were born between January 1, 1952 and December 31, 1955 there are. Additionally, he would like to identify employees who are eligible to participate in a mentorship program to assist in filling those employee gaps. 

***RESULTS***

**Deliverable 1**
For the modelling portion, an ERD was created in order to label, organize, join and visualize the 6 variables considered within Pewlett_Hackard:departments, employees, salaries, managers, employees per department and employee titles (figure 1).

<img width="1440" alt="EmployeeDB" src="https://user-images.githubusercontent.com/90135381/146650339-26ecf634-0ae5-41ae-844b-8b4f3ccef2b8.png">
                                      
                                    Figure 1: ERD of EmployeesDB



The wrangling portion enatailed importing the company data  into the database and clean, join the data for accurate assessment. The clean data was then imported and formatted using SQL and data was parsed to create pertinent tables to attain the required information.

In figure 2, it can be ascertained that the amount of retirees will effect Pewlett_Hackard significantly, paticularlly in the following 2 ways:
1. Of the total amount of employees, 90,398 employees, will potentially be retiring, which would translate into a significant loss of work-force in a short period of time. 
2. Of the 90,398 employees, 57,668 senior staff will be retiring, which would translate into a 63.8% loss of senior work-force in a short period of time, the engineering department would sustain the greatest loss, followed by senior staff, enginners/staff and lastly technical leaders/assistant engineers.

<img width="1440" alt="unique_titles table" src="https://user-images.githubusercontent.com/90135381/146650425-58ccf36c-9aa7-4e6f-8af4-a258e399e321.png">


                                  Figure 2: Retirement Titles
                                  
                                  
<img width="1440" alt="Retirement_Titles" src="https://user-images.githubusercontent.com/90135381/146651226-b47b9702-5711-4b45-9370-e48fb46e41e7.png">




                                  Figure 3: Unique Titles
                                  
  
  **Deliverable 2**


Due to the decline in experienced senior staff, a mentorship program ws to be implemented, grouped by title and department, in order to remedy this work-force imbalance. A joining of tables revealed a list of employees who were eligable for mentorship.

<img width="1440" alt="Mentorship_Eligibility" src="https://user-images.githubusercontent.com/90135381/146651393-13bb6da4-5b63-4fd8-80d0-d0ea9f8532ff.png">




                                Figure 4: Mentorship Eligibility

3. This table reveals that there are not enough mentees available to fill all of the roles of the retiring personel at Pewlett Hackard, particularly in the senior divisions.
4. 


                                
                                
          


***SUMMARY***

How many roles need to be filled to make impact? 

<img width="1440" alt="rolls_to_fill" src="https://user-images.githubusercontent.com/90135381/146655210-50f1193d-c698-41fa-babe-30477494377b.png">


                                Figure 5: Rolls to Fill
                                

Are there enough qualified, retirement-redy employees in the depts to mentor next-gen of Pewlett_Hackard employees?

<img width="1440" alt="qualified staff" src="https://user-images.githubusercontent.com/90135381/146655248-9c986efe-8f5b-4dfb-a3ba-47867f017c41.png">


                                Figure 6: Qualified Staff

***REFERENCES*** Google, GitHub, StackOverflow, Bootcamp
