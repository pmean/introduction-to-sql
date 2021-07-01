---
title: "MEDB 5508, Introduction to SQL, Module07, Assignments"
---

#### Discuss07

Grading rubric is available on [my Github site][gra1]. One point deduction if submitted after the due date.

Review the videos in this module and briefly answer the following questions

+ What was the most important thing that you learned?
+ What concept(s) do you still find confusing?

Please keep your answers brief. You are welcome to say something generic like "I found nothing confusing" or "I found everything confusing" or "I agree with the previous comment."

#### HW07, Mismatches/set operators

<!---Double check. There were some issues with question 5.--->

M07-Q01. Do an inner join of the acupuncture_baseline_results table and acupuncture_one_year_results table. Display the first ten rows of data only.

M07-Q02. Do a left join of acupuncture_baseline_results and acupuncture_one_year_results and display the fields id, pk1, and pk5. Display the first ten rows of data only. Explain why these results are different from the results of the previous question.

M07-Q03. Count the number of records after an inner join of acupuncture_baseline_results and acupuncture_one_year_results. Count the number of records after a left join of acupuncture_baseline_results and acupuncture_one_year_results.

M07-Q04. Compute the average pk score at baseline, the average score at one year, and the average change score.

M07-Q05. Display all the pk1 values for patients 64 and older.

M07-Q06. There are 100 patients with baseline values but no values at one year. Print the ids of the first ten of these patients.

M07-Q07. Compute the intersection of the ids from acupuncture_baseline_results and acupuncture_one_year_results. Display the first ten rows of data only.

M07-Q08. Compute the union of the ids from acupuncture_baseline_results and acupuncture_one_year_results. Display the first ten rows of data only.

M07-Q09. In a previous module, you were asked to list the first ten ids that were in acupuncture_baseline_resuts but not in acupuncture_one_year_results. Use the set operator "minus" to achieve the same goal. Note: for SQLite, use "except" instead of "minus".

Refer to [this page][git1] for a description of the data files. 

[gra1]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md
