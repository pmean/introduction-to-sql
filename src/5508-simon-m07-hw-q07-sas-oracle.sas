*************************************************
5508-simon-m07-hw-q07-sas-oracle
author: Steve Simon
creation date: 2020-07-27

purpose: to illustrate answers to homework in 
module07

license: public domain

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.
  
Q7. In a previous question, you were asked to
list the first ten ids that were in 
acupuncture_baseline_results but not in 
acupuncture_one_year_results. Use the set 
operator "except".

Note: Some of the names used in this code are
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is  
[Helen Walker](https://en.wikipedia.org/wiki/Helen_M._Walker).
*************************************************;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m07-hw-q07-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  walker
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';


proc sql;
  create table helen_q7 as
    select id
      from walker.acupuncture_baseline_results
    except
    select id
      from walker.acupuncture_one_year_results
  ;
quit;

proc print
  data=helen_q7;
    title1 "Listing of ids found at baseline but not at one year";
run;

ods pdf close;
