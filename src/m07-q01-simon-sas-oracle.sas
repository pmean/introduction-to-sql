*************************************************
m07-q01-simon-sas-oracle
author: Steve Simon
creation date: 2020-07-27

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

Note: Some of the names used in this code are
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is 
[Hirotugu Akaike](https://en.wikipedia.org/wiki/Hirotugu_Akaike).
*************************************************;

ods pdf file="q:/introduction-to-sql/results/m07-q01-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  akaike
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table hirotugu_inner as
    select count(*) as n
      from akaike.acupuncture_baseline_results as b
      join akaike.acupuncture_one_year_results as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu_inner;
  title1 "There are 301 records after an inner join";
run;

proc sql;
  create table hirotugu_left as
    select count(*) as n
      from akaike.acupuncture_baseline_results as b
      left join akaike.acupuncture_one_year_results as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu_left;
  title1 "There are 401 records after a left join";
  title2 "The left join has more data because it includes";
  title3 "patients who dropped out at one year.";
run;

ods pdf close;
