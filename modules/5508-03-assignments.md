---
title: "MEDB 5508, Introduction to SQL, Module03, Assignments"
authors: Suman Sahil and Steve Simon
date: Created 2021-04-03
---

#### Discuss03

Review the videos in this module and briefly answer the following questions

+ What was the most important thing that you learned?
+ What concept(s) do you still find confusing?

Please keep your answers brief. You are welcome to say something generic like "I found nothing confusing" or "I found everything confusing" or "I agree with the previous comment."

#### HW03, Practice with null values

Grading rubric is available on [my Github site][gra1]. One point deduction if submitted after the due date.

Q1. Verify that the hospital id code (HOSP_ID) has no missing values. Be sure to use count(*) instead of count(HOSP_ID).

Q2. There are only two fields in the database that have null values. Get a count of the number of missing values for the indicator for teaching hospital (TEACHING_IND).

Q3. There is only one hospital where the number of beds (BED_SIZE) is unknown. Find the id of that hospital.

Combine your results into a single PDF file and submit it.

Refer to [this page][git1] for a description of the data files. 

#### Quiz03

Please review the videos in this module before taking this quiz.

+ How does the avg function handle NULL values? ...
+ Prepared statements with parameterized queries help protect against what type of attack? ...
+ What does SAS convert NULL values to? ...
+ What actions can help to maintain security for a database? ...

[gra1]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md
[git1]: https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md
