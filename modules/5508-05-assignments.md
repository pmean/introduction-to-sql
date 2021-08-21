---
title: "MEDB 5508, Introduction to SQL, Module05, Assignments"
authors: Suman Sahil and Steve Simon
date: Created 2021-04-03
---

#### Discuss05

Review the videos in this module and briefly answer the following questions

+ What was the most important thing that you learned?
+ What concept(s) do you still find confusing?

Please keep your answers brief. You are welcome to say something generic like "I found nothing confusing" or "I found everything confusing" or "I agree with the previous comment."

#### HW05, Practice with conversion functions and conditional expressions

Graded: 3 points, one point deduction if submitted after deadline

Grading rubric is available on [my Github site][gra1]. One point deduction if submitted after the due date.

Q1. Use the encounter table in the ehr database. Classify age into two groups labelled 'Child' and 'Adult'. A child represents patients with age <= 20 and an adult represents patients with age >20. Hint: use the case function. Remember not to print out more than 20 rows of data.

Q2. Use the hospital table in the ehr database. Convert null values of teaching_ind to -1 and print the values only for  census_reg = "West". Hint: Use coalesce function.

Q3. Use the ehr database and write a SQL query that will list all the table names.

Q4. Use the melange database and write a SQL query that will list all the field names in the crawling table.

Put your code and the output in a single PDF file.

Refer to [this page][git1] for a description of the data files. 

#### Quiz05

Please review the videos in this module before taking this quiz.

+ What function is often used to substitute a default value for nulls ...
+ What function in SQL is the programming equivalent of IF..THEN..ELSE ...
+ What function could help you simplify the following SQL code: where id=12 or id=24 or id=45 ...
+ Why might you want to separate database information into two or more tables? ...

You can also find this information on [my github site][thisf]. If there is a discrepancy, the Canvas site takes precedence. 

Here are [links to other important files][mygit] on my github site.

<!---my git--->
[thisf]: https://github.com/pmean/introduction-to-sql/blob/master/modules/5508-05-assignments.md
[mygit]: https://github.com/pmean/introduction-to-sql/blob/master/README.md


[git1]: https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md
[gra1]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md
