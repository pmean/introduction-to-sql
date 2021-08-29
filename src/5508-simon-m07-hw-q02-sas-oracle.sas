*************************************************
5508-simon-m07-hw-q02-simon-sas-oracle
author: Steve Simon
creation date: 2020-07-27

purpose: to illustrate answers to homework in 
module07

license: public domain

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.
  
Q2. Compute the average pk score at baseline, the
average score at one year, and the average change
score. Without running any formal statistical
tests, tell us whether you think the pk scores
are increasing, decreasing, or staying about the
same.

Note: Some of the names used in this code are
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is 
[Hirotugu Akaike](https://en.wikipedia.org/wiki/Hirotugu_Akaike).
*************************************************;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m07-hw-q02-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  akaike
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table hirotugu_q2 as
    select 
      avg(b.pk1) as pk1_avg,
      avg(o.pk5) as pk5_avg,
      avg(b.pk1)-avg(o.pk5) as change_score
      from akaike.acupuncture_baseline_results as b
      join akaike.acupuncture_one_year_results as o
      on b.id=o.id
  ;
quit;

proc print
  data=hirotugu_q2;
  title1 "There is a decline from baseline to one year";
run;

ods pdf close;
