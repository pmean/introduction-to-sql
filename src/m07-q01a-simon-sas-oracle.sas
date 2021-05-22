* hw13a.sas
* written by Steve Simon
* creation date: 2020-07-27;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.
  
1. Do an inner join of baseline_table and one_year_table. Display the 
first ten rows of data only.

2. Explain why id 104 included in this inner join, but not the inner 
join shown in the video?

3. Count the number of records after an inner join of baseline_table
and year_one_table. Compare this to the number of records in the 
year_one_table.

4. Compute the average pk score at baseline, the average score at one
year, and the average change score.

5. Find and list the two labels in migraine_table that do not 
correspond to any codes in demog_table.

6. Show that there are no unmatched labels or unmatched codes for 
group_table.



Note: Some of the names used in this code are arbitrary and you can 
choose whatever names you want. To emphasize which names can be 
modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is 
[Hirotugu Akaike](https://en.wikipedia.org/wiki/Hirotugu_Akaike).

ods pdf file="q:/introduction-to-sql/results/hw13a-solution-using-sas-oracle-output.pdf";

%include 'n:/home/s/simons/sql files/super-secret.sas';
libname
  akaike
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

proc sql;
  create table hirotugu1 as
    select b.id, b.pk1, o.pk5
      from akaike.baseline_table as b
      join akaike.one_year_table as o
      on b.id=o.id
      where monotonic() <= 10
  ;
quit;

proc print
  data=hirotugu1;
  title1 "Question 1.";
  title2 "First ten rows in joined data";
run;

proc sql;
  create table hirotugu2a as
    select count(*)
      from akaike.baseline_table
      where id = 104
  ;
quit;

proc print
  data=hirotugu2a;
  title1 "Question 3";
  title2 "Number of records in baseline_table with id=104";
run;

proc sql;
  create table hirotugu2b as
    select count(*)
      from akaike.three_month_table
      where id = 104
  ;
quit;

proc print
  data=hirotugu2b;
  title2 "Number of records in three_month_table with id=104";
run;

proc sql;
  create table hirotugu2c as
    select count(*)
      from akaike.one_year_table
      where id = 104
  ;
quit;

proc print
  data=hirotugu2c;
  title2 "Number of records in one_year_table with id=104";
run;

proc sql;
  create table hirotugu3a as
    select count(b.id) as n
      from akaike.baseline_table as b
      join akaike.one_year_table as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu3a;
  title1 "Question 3";
  title2 "Number of records after joining baseline_table and one_year_table";
run;

proc sql;
  create table hirotugu3b as
    select count(*) as n
      from akaike.one_year_table
  ;
quit;

proc print
  data=hirotugu3b;
  title1 "Question 3";
  title2 "Number of records in one_year_table";
run;

proc sql;
  create table hirotugu4 as
    select 
      avg(b.pk1) as pk1_avg,
      avg(o.pk5) as pk5_avg,
      avg(b.pk1)-avg(o.pk5) as change_score
      from akaike.baseline_table as b
      join akaike.one_year_table as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu4;
  title1 "Question 4";
  title2 "Average scores at baseline and one year, plus a change score";
run;

/*
     This code should include
     where d.migraine is null
*/ 
proc sql;
  create table hirotugu5 as
    select 
      unique m.migraine_label
      from akaike.migraine_table as m
      left join akaike.demog_table as d
      on m.migraine_code=d.migraine
  ;
quit;

proc print
  data=hirotugu5;
    title1 "Question 5";
    title2 "Codes in migraine_table not found in demog_table";
run;

proc sql;
  create table hirotugu6 as
    select 
      count(g.group_code) as n
      from akaike.group_table as g
      left join akaike.demog_table as d
      on g.group_code=d.grp
      where d.grp is null
  ;
quit;

proc print
  data=hirotugu6;
  title1 "Question 6";
  title2 "Verifying that no codes in group_table are not also found in demog_table";
run;

ods pdf close;
