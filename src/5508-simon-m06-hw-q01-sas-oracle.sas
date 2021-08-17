*************************************************

m06-q01-simon-sas-oracle.sas
author: Steve Simon
creation date: 2020-07-25

Purpose: To answer homework questions from module06.

Note: This solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.

Some of the names used in this code are 
arbitrary and you can choose whatever names you 
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is 
[Robert V. Hogg](https://en.wikipedia.org/wiki/Robert_V._Hogg).

1. List id and migraine_label for the first ten
records after joining the acupuncture_demographics
and acupuncture_migraine_labels tables.

*************************************************;

ods pdf file="q:/introduction-to-sql/results/m06-q01-simon-sas-oracle.pdf";



%include 'q:/sql files/super-secret.sas';
libname
  hogg
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

proc sql;
  create table robert as
    select r.id, g.group_label
      from hogg.results_table as r
      join hogg.group_table as g
      on r.group_n=g.group_code
      where monotonic() <= 10
  ;
quit;

proc print
  data=robert;
run;

ods pdf close;
