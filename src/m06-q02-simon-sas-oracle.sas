*************************************************

m06-q02-simon-sas-oracle.sas
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

2. Get a count of the number of records in the
database in the control group and the treatment
group. Use the label for group and not the number
code.

*************************************************;

ods pdf file="q:/introduction-to-sql/results/m06-q02-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  hogg
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table robert as
    select g.group_label, count(*) as n
      from hogg.acupuncture_demographics as d
      join hogg.acupuncture_group_labels as g
      on d.grp=g.group_code
      group by g.group_label
  ;
quit;

proc print
  data=robert;
run;

ods pdf close;
