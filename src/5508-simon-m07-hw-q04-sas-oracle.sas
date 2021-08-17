*************************************************
m07-q04-simon-sas-oracle
author: Steve Simon
creation date: 2020-07-27

purpose: to illustrate answers to homework in 
module07

license: public domain

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.
  
Q4. There are 100 patients with baseline values
but no values at one year. Use a left join to
identify these patients.

Note: Some of the names used in this code are
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is 
[Hirotugu Akaike](https://en.wikipedia.org/wiki/Hirotugu_Akaike).
*************************************************;

ods pdf file="q:/introduction-to-sql/results/m07-q04-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  akaike
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table hirotugu_q4 as
    select 
      b.id as unmatched_ids
      from akaike.acupuncture_baseline_results as b
      left join akaike.acupuncture_one_year_results as o
      on b.id=o.id
    where o.id is null
  ;
quit;

proc print
  data=hirotugu_q4;
  title1 "Listing of mismatched ids";
run;


ods pdf close;
