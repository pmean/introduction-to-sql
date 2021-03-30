---
title: "MEDB 5508, Introduction to SQL, Module09, Assignments"
---

#### HW09, Practice with conversion functions and conditional expressions

Graded: 3 points, one point deduction if submitted after deadline

I am consolidating documentation for all databases and data tables [here](https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md).

–Put your code and the output in a single PDF file

–Use Encounter Table

–Use case expression to classify age <= 20 as ‘Group 1’, and age > 20 as ‘Group 2’ 

–Use hospital table

–Use coalesce function to return -1 for null values of teaching_ind in hospital table where census_reg = ‘West’

#### Quiz09

What would the output of "select coalesce(null,'1') from dual" ...

The maximum number of arguments in a CASE expression is ...
 
What date format should be used? (Fill in the blank)

SELECT TO_DATE('1999 05 20',   ____________) from dual;

Which SQL functions are capable of typecasting column value, literal or an expression? (Multiple answers are possible)
 
What is the output of following query?

SELECT
  DECODE(1, 2, 'One','Not one')
FROM
  dual;
