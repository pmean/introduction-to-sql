*************************************************

5508-simon-m05-hw-q01-sas-oracle.sas
author: Steve Simon
creation date: 2020-07-12

Purpose: To answer M05-Q01. Use the encounter
table in the ehr database. Classify age into
two groups labelled 'Child' and 'Adult'. A
child represents patients  with age <= 20 and
an adult represents patients with age > 20.
 
Hint: use the case function.

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.

Some of the names used in this code are 
arbitrary and you can choose whatever names you 
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is 
[Barbara A. Bailar](https://en.wikipedia.org/wiki/Barbara_A._Bailar).

*************************************************;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m05-hw-q01-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  bailar
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table barbara as
  select 
    age,
    case 
      when age <= 20
        then 'Child'
        else 'Adult'
      end as age_group
  from bailar.encounter
  where monotonic() <= 10
  ;
quit;

proc print
  data=barbara;
  title1 "A listing of child and adult classifications";
run;

ods pdf close;
