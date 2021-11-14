---
title: "MEDB 5508, Introduction to SQL, Module06, Assignments"
authors: Suman Sahil and Steve Simon
date: Created 2021-04-03
---

#### Discuss06

Review the videos in this module and briefly answer the following questions

+ What was the most important thing that you learned?
+ What concept(s) do you still find confusing?

Please keep your answers brief. You are welcome to say something generic like "I found nothing confusing" or "I found everything confusing" or "I agree with the previous comment."

#### HW06, Practice with retrieving data from multiple tables

Grading rubric is available on [my Github site][gra1]. One point deduction if submitted after the due date.

Q1. Use the various acupuncture tables. List id and migraine_label for the first ten records after joining the acupuncture_baseline_results table and acupuncture_migraine_labels table.

Q2. Get a count of the number of records in the database in the control group and the treatment group from the acupuncture_demographics table. Use the label for group (found in the acupuncture_group_labels table) and not the number code.

Q3. Get a count of the numbers of males and females (from the acupuncture_demographics table) where you restrict age to be less than 40. Use the label for sex (from the acupuncture_sex_labels table), but convert it to all uppercase.

Put your code and the output in a single PDF file.

Warning! The names of the various acupuncture tables and the names of the fields (columns/variables) in each table are tricky and inconsistent. For example, some fields use the abbreviation "grp" and others spell it out completely as "group". You should look at the [data dictionary][git1] for the acupuncture tables.

#### Quiz06

Please review the videos in this module before taking this quiz.

All questions are True/False.

+ A left outer join, right outer join, or full outer join can sometimes produce null values for records that do not match.
+ If table1 has 40 thousand records, and table2 has 2 thousand records, there will be 80 million records in the Cartersian product.
+ A self join occurs when the foreign key in a table is linked to the primary key in the same table.
+ Aliases are not really needed unless you are joining three or more tables in a single SQL query.
+ You can use a foreign key as a primary key.
+ A foreign key can reference a  unique key in the same table or another table.
+ A primary key can accept multiple NULL values.

<!---my git--->
This information is available both in Canvas and on [my github site][thisf].

The [readme.md file][mygit] on this site provides links to other important files for this class. If there is a discrepancy between the github site and the Canvas site, the Canvas site takes precedence.

[thisf]: https://github.com/pmean/introduction-to-sql/blob/master/modules/5508-06-assignments.md
[mygit]: https://github.com/pmean/introduction-to-sql/blob/master/README.md
<!---my git--->

[gra1]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md

[git1]: https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture-data-dictionary.md


