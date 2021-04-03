---
title: "Cholesterol data dictionary"
authors: Suman Sahil and Steve Simon
date: Created 2021-04-03
---

This dataset comes from the OzDASL data repository.

Smyth, GK (2011). Australasian Data and Story Library
(OzDASL). http://www.statsci.org/data.

The copyright statement says that you can "freely
use" this data, but that republication may require
permission from the original copyright holder. The
revised versions I am using (described below) are
produced under the protection of the Fair Use 
provisions of U.S. copyright law.

The data represents cholesterol levels of patients
at 2, 4, and 14 days after a heart attack.

You can find a description of this dataset at

+ http://www.statsci.org/data/general/cholest.html

and the data itself is at

+ http://www.statsci.org/data/general/cholestg.txt    
    
A modified version of this data with the control
subjects and missing values removed is stored at
    
+ https://github.com/classes-medb/5508/blob/master/data/cholesterol.csv

The dataset has 3 fields and 84 records.

+ patient, a sequential number 1-28 for each patient
+ day, the day from baseline that measurement was taken
+ cholest, cholesterol level

This data is used in MEDB 5508, Introduction to SQL.

It is stored in table named cholesterol in both an Oracle
database and a SQLite database.

If you are accessing the data through Oracle, you do
not need to download anything, as it is stored on the
Insights Platform. Please be sure to specify

+ schema=melange

in your code.

If you are accessing the data through SQLite, you need
to download the file melange.SQLite, available at

+ https://github.com/classes-medb/5508/blob/master/data/melange.SQLite

