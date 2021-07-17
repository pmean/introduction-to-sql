*************************************************
m07-q01-simon-sas-oracle
author: Steve Simon
creation date: 2020-07-27;

purpose: to illustrate answers to homework in 
module07

license: public domain

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.
  
Q1. Count the number of records after an inner
join of acupuncture_baseline_results and 
acupuncture_one_year_results. Count the number of
records after a left join of 
acupuncture_baseline_results and 
acupuncture_one_year_results. Why are these 
numbers different?

Q2. Compute the average pk score at baseline, the
average score at one year, and the average change
score. Without running any formal statistical
tests, tell us whether you think the pk scores
are increasing, decreasing, or staying about the
same.

Q3. Display all the pk1 values for patients 64
and older.

Q4. There are 100 patients with baseline values
but no values at one year. Use a left join to
identify these patients. Print the ids of the
first ten of these patients.

Q5. Compute the intersection of the ids from 
acupuncture_baseline_results and 
acupuncture_one_year_results. Display the first
ten rows of data only.

Q6. Compute the union of the ids from 
acupuncture_baseline_results and 
acupuncture_one_year_results. Display the first
ten rows of data only.

Q7. In a previous question, you were asked to
list the first ten ids that were in 
acupuncture_baseline_results but not in 
acupuncture_one_year_results. Use the set 
operator “minus” to achieve the same goal. 
Note: for SQLite, use “except” instead of 
“minus”.

Note: Some of the names used in this code are
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is 
[Hirotugu Akaike](https://en.wikipedia.org/wiki/Hirotugu_Akaike).

The statistician being honored in this code is 
[Helen Walker](https://en.wikipedia.org/wiki/Helen_M._Walker).


*************************************************;

ods pdf file="q:/introduction-to-sql/results/m07-q01-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  akaike /* walker */
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

proc sql;
  create table hirotogu_inner as
    select count(*) as n
      from acupuncture_baseline_results as b
      join acupuncture_one_year_results as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu_inner;
  title1 "There are 301 records after an innter join";
run;

proc sql;
  create table hirotugu_left as
    select count(*) as n
      from acupuncture_baseline_results as b
      left join acupuncture_one_year_results as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu_left;
  title1 "There are 401 records after a left join";
  title2 "The left join has more data because it includes";
  title3 "patients who dropped out at one year."
run;

*************************************************;

proc sql;
  create table hirotugu as
    select 
      avg(b.pk1) as pk1_avg,
      avg(o.pk5) as pk5_avg,
      avg(b.pk1)-avg(o.pk5) as change_score
      from acupuncture_baseline_results as b
      join acupuncture_one_year_results as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu;
  title1 "Q2";
run;

*************************************************;

proc sql;
  create table hirotugu as
      d.id, d.age, b.pk1
      from acupuncture_demographics as d
      inner join acupuncture_baseline_results as b
      on d.id=b.id
      where d.age >= 64
  ;
quit;

proc print
  data=hirotugu;
  title1 "Q3";
run;

************************************************;

proc sql;
  create table hirotugu as
    select 
      b.id as unmatched_ids
      from acupuncture_baseline_results as b
      left join acupuncture_one_year_results as o
      on b.id=o.id
    where o.id is null and
      monotonic() <= 10
  ;
quit;

proc print
  data=hirotugu;
  title1 "Q4";
run;

************************************************;

proc sql;
  create table helen as
    select id
      from acupuncture_baseline_results
    intersect
    select id
      from acupuncture_one_year_results
    where monotonic() <= 10
  ;
quit;

proc print
  daata=helen;
  title1 "Q5";
run;

*************************************************;

proc sql;
  create table helen as
    select id
      from acupuncture_baseline_results
    union
    select id
      from acupuncture_one_year_results
    where monotonic() <= 10
  ;
quit;

proc print
  data=helen;
  title1 "Q6";
run;

*************************************************;

proc sql;
  create table helen as
    select id
      from acupuncture_baseline_results
    minus
    select id
      from acupuncture_one_year_results
    where monotonic() <= 10
  ;
quit;

proc print
  data=helen;
    title1 "Q7";
run;

ods pdf close;
