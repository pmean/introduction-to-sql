---
title: "Acupuncture data dictionary"
authors: Suman Sahil and Steve Simon
date: Created 2021-04-03
---

+ Acupuncture data dictionary
  + This dataset was downloaded from 
    + Steven C. Grambow, “Acupuncture Dataset”, TSHS Resources Portal (2015). Available in [html format](https://www.causeweb.org/tshs/acupuncture/). You need to register at the portal before downloading this dataset.
  + You can also find the file at
    + https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1489946/bin/1745-6215-7-15-S1.xls
  + If you are using Oracle, you need to specify
    + schema=melange
  + If you are using SQLite, you need to download the file
    + melange.SQLite from [this page](https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md).
  + You should not need to use this, but we have a backup of these data in CSV format
    + [acupuncture_baseline_results](https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture_baseline_results.csv).
    + [acupuncture_demographics](https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture_demographics.csv).
    + [acupuncture_group_labels](https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture_group_labels.csv).
    + [acupuncture_migraine_labels](https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture_migraine_labels.csv).
    + [acupuncture_one_year_results](https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture_one_year_results.csv).
    + [acupuncture_sex_labels](https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture_sex_labels.csv).
    + [acupuncture_three_month_results](https://github.com/pmean/introduction-to-sql/blob/master/data/acupuncture_three_month_results.csv).
  + There are seven tables associated with this study
    + acupuncture_baseline_results, headache scores at baseline
    + acupuncture_demographics, demographics for each patient
    + acupuncture_group_labels, labels for the two groups in the study.
    + acupuncture_migraine_labels, labels for the two types of headaches
    + acupuncture_one_year_results, headache scores at 12 months
    + acupuncture_sex_labels, labels for males and females
    + acupuncture_three_month_results, headache scores at 3 months
  + acupuncture_baseline_results has 401 records and 3 fields
    + id, a three digit number code for each patient
    + pk1, headache severity score at baseline
    + f1, headache frequency at baseline
  + acupuncture_demographics has 401 records and 8 fields
    + id, a three digit number code for each patient
    + age, age of the patient in years
    + sex, a numeric code for sex
    + migraine, a numeric code for headache type
    + chronicity, number of years of headache disorder
    + acupuncturist, a three digit number code for acupuncturist
    + practice_id, a two digit code for practice
    + grp, a numeric code for treatment group
  + acupuncture_group_labels has 2 records and 2 fields
    + group_code, the number codes used for the two treatment group
    + group_label, a text description of the two treatment groups
  + acupuncture_migraine_labels has 2 records and 2 fields
    + migraine_code, the number codes used for the two headache types
    + migraine_label, a text description of the two headache types
  + acupuncture_one_year_results has 301 records and 3 fields
    + id, a three digit number code for each patient
    + pk5, headache severity score after twelve months
    + f5, headache frequency after twelve months
  + acupuncture_sex_labels has 2 records and 2 fields
    + sex_code, the number codes that designate sex
    + sex_label, a text description (male, female)
  + acupuncture_three_month_results has 326 records and 3 fields
    + id, a three digit number code for each patient
    + pk2, headache severity score after three months
    + f2, headache frequency after three months
