*************************************************
5508-simon-m07-hw-q05-sas-oracle
author: Steve Simon
creation date: 2020-07-27

purpose: to illustrate answers to homework in 
module07

license: public domain

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.
  
Q5. Compute the intersection of the ids from 
acupuncture_baseline_results and 
acupuncture_one_year_results.

Note: Some of the names used in this code are
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is  
[Helen Walker](https://en.wikipedia.org/wiki/Helen_M._Walker).
*************************************************;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m07-hw-q05-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  walker
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table helen_q5 as
    select id
      from akaike.acupuncture_baseline_results
    intersect
    select id
      from akaike.acupuncture_one_year_results
  ;
quit;

proc print
  data=helen_q5;
  title1 "Listing of intersection for ids";
run;

ods pdf close;
