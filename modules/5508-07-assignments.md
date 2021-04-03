---
title: "MEDB 5508, Introduction to SQL, Module07/08, Assignments"
authors: Suman Sahil and Steve Simon
date: Created 2021-04-03
---

#### HW07, Practice with single row functions

Graded: 3 points, one point deduction if submitted after deadline

I am consolidating documentation for all databases and data tables [here](https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md).

1. Use the cigarettes table in the melange database. The variable weight_g is recorded to four decimal places. Round all the values to two decimal places and display them.

Special note for SAS users. SAS uses a different syntax for the round function, even within  proc sql. The statement round(x, y) will round x to the nearest multiple of y. So round(23.134, 2) will produce the nearest multiple of 2, which is 24. To round to two decimal places in SAS, you need to use round(23.134, 0.01) which produces 23.13 as the result. You can find more information about SAS here (Links to an external site.).

2. Use the hospital table in the ehr database. The variable ACUTE_NONACUTE has the values Acute and Non-Acute. Use the substr function to convert these two values to the first letter (A or N). Print out the first ten values only.

3. Use the patient_type table in the ehr database. Refer to the data dictionary for this table. List all the values of PAT_TYPE_DESC after converting the data to lower case.

4. Put your code and output in a single pdf file

#### Quiz07

Graded: 3 points, one point deduction if submitted late.

Which functions work with strings ...

Which functions work with numbers ...

A feature of the single-row function is that it ...

True or False: A single row function must output a value of the same type as the input argument

#### HW08, Practice with statistical summaries

Graded: 3 points, one point deduction if submitted after deadline

I am consolidating documentation for all databases and data tables [here](https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md).

Run a query to count the number of passengers with the title "Mr" somewhere in their name.

Run a query that counts the number of male and female children (Age <= 18)

Run a query that identifies the ages of the youngest and oldest patients in each passenger class.

The Survived field has values of 0 (died) and 1 (alive) and an average of this value provides a probability of survival. Calculate this probability for six categories representing the combination of passenger class and sex. Include only those groups where the survival probability is greater than 30%.

Place the SQL code and the results of all your queries in a single PDF file.

#### Quiz08

Graded: 1 point

The where statement and the having statement allow you to filter your data. In which order are these two statements processed ...

