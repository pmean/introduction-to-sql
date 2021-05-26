---
title: "MEDB 5508, Introduction to SQL, Module07/08, Assignments"
authors: Suman Sahil and Steve Simon
date: Created 2021-04-03
---

#### HW04, Practice with single row functions and statistical summaries

Graded: 3 points, one point deduction if submitted after deadline

M04-Q01. Use the cigarettes table in the melange database. The variable weight_g is recorded to four decimal places. Round all the values to two decimal places and display them.

Special note for SAS users. SAS uses a different syntax for the round function, even within  proc sql. The statement round(x, y) will round x to the nearest multiple of y. So round(23.134, 2) will produce the nearest multiple of 2, which is 24. To round to two decimal places in SAS, you need to use round(23.134, 0.01) which produces 23.13 as the result. You can find more information about SAS [here][sas1].

M04-Q02. Use the hospital table in the ehr database. The variable ACUTE_NONACUTE has the values Acute and Non-Acute. Use the substr function to convert these two values to the first letter (A or N). Print out the first ten values only.

M04-Q03. Use the titanic table in the melange database. Run a query that counts the number of male and female children (Age <= 18)

M04-Q04. Use the titanic table in the melange database. Run a query that identifies the ages of the youngest and oldest patients in each passenger class.

Put your code and output in a single pdf file

#### Quiz04

Please review the videos in this module before taking this quiz.

+ The where statement and the having statement allow you to filter your data. In which order are these two statements processed ...
+ What function will convert the string "sql" to "SQL" ...
+ What function will compute the smallest value in a numeric field ...
+ True or False: A single row function must output a value of the same type as the input argument

[sas1]: https://sasexamplecode.com/how-to-round-numbers-in-sas/