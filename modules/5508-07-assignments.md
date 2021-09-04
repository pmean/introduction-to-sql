---
title: "MEDB 5508, Introduction to SQL, Module07, Assignments"
---

#### Discuss07

Review the videos in this module and briefly answer the following questions

+ What was the most important thing that you learned?
+ What concept(s) do you still find confusing?

Please keep your answers brief. You are welcome to say something generic like "I found nothing confusing" or "I found everything confusing" or "I agree with the previous comment."

#### HW07, Mismatches/set operators

The grading rubric is available on [my Github site][gra1]. One point deduction if submitted after the due date.

Q1. Count the number of records after an inner join of acupuncture_baseline_results and acupuncture_one_year_results. Count the number of records after a left join of acupuncture_baseline_results and acupuncture_one_year_results. Why are these numbers different?

Q2. Compute the average pk score at baseline, the average score at one year, and the average change score. Without running any formal statistical tests, tell us whether you think the pk scores are increasing, decreasing, or staying about the same.

Q3. Display all the pk1 values for patients 64 and older.

Q4. There are 100 patients with baseline values but no values at one year. Use a left join to identify these patients. Print the ids only for values of 130 or less.

Q5. Compute the intersection of the ids from acupuncture_baseline_results and acupuncture_one_year_results. Print the ids only for values of 130 or less.

Q6. Compute the union of the ids from acupuncture_baseline_results and acupuncture_one_year_results. Print the ids only for values of 130 or less.

Q7. In a previous question, you were asked to list the first ten ids that were in acupuncture_baseline_results but not in acupuncture_one_year_results. Use the set operator “minus” to achieve the same goal. Note: for SQLite, use “except” instead of “minus”. Print the ids only for values of 130 or less.

Warning! The names of the various acupuncture tables and the names of the fields (columns/variables) in each table are tricky and inconsistent. For example, some fields use the abbreviation "grp" and others spell it out completely as "group". Refer to [this page][git1] for a description of the data files. 

<!---my git--->
This information is available both in Canvas and on [my github site][thisf].

The [readme.md file][mygit] on this site provides links to other important files for this class. If there is a discrepancy between the github site and the Canvas site, the Canvas site takes precedence.

[thisf]: https://github.com/pmean/introduction-to-sql/blob/master/modules/5508-07-assignments.md
[mygit]: https://github.com/pmean/introduction-to-sql/blob/master/README.md
<!---my git--->

[git1]: https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture-data-dictionary.md

[gra1]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md
