* hw11a.sas
* written by Steve Simon
* creation date: 2020-07-25;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

Note: Some of the names used in this code are arbitrary and you can 
choose whatever names you want. To emphasize which names can be 
modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is 
[Robert V. Hogg](https://en.wikipedia.org/wiki/Robert_V._Hogg).

Use the same database shown in the video. It is available on the 
Insights platform, or you can download a sqlite file from Canvas.

1. List id and migraine_label for the first ten records after joining
the results_table and migraine_table.

2. Get a count of the number of records in the database in the control
group and the treatment group. Use the label for group and not the 
number code.

3. Get a count of the numbers of males and females where you restrict 
age to be less than 40. Use the label for sex, but convert it to all 
uppercase.

ods pdf file="q:/introduction-to-sql/results/hw11a-solution-using-sas-oracle-output.pdf";



%include 'q:/sql files/super-secret.sas';
libname
  hogg
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

proc sql;
  create table robert1 as
    select r.id, g.group_label
      from hogg.results_table as r
      join hogg.group_table as g
      on r.group_n=g.group_code
      where monotonic() <= 10
  ;
quit;

proc print
  data=robert1;
run;

proc sql;
  create table robert2 as
    select g.group_label, count(r.id) as n
      from hogg.results_table as r
      join hogg.group_table as g
      on r.group_n=g.group_code
      group by g.group_label
  ;
quit;

proc print
  data=robert2;
run;

proc sql;
  create table robert3 as
    select 
        upper(s.sex_label) as gender,
        count(r.id) as n
      from hogg.results_table as r
      join hogg.sex_table as s
        on r.sex=s.sex_code
      where age < 40
      group by gender
  ;
quit;

proc print
  data=robert3;
run;



ods pdf close;
