* hw09a.sas
* written by Steve Simon
* creation date: 2020-07-12;

* Purpose: To answer M05-Q01. Use the encounter
* table in the ehr database. Classify age into
* two groups labelled 'Child' and 'Adult'. A child represents patients with age <= 20 and an adult represents patients with age >20. Hint: use the case function.

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

Use the Encounter Table. Use case expression to classify age <= 40 as 
Group 1, and age > 40 as Group 2

Use the hospital table. Use coalesce function to return -1 for null
values of teaching_ind in hospital table where census_reg = West

Note: Some of the names used in this code are arbitrary and you can 
choose whatever names you want. To emphasize which names can be 
modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is 
[Barbara A. Bailar](https://en.wikipedia.org/wiki/Barbara_A._Bailar).;

ods pdf file="q:/introduction-to-sql/results/hw09a-solution-using-sas-oracle-output.pdf";



%include 'q:/sql files/super-secret.sas';
libname
  bailar
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table barbara1 as
  select 
    teaching_ind,
    coalesce(teaching_ind, -1) as imputed_value
  from bailar.hospital
  where census_reg='West'
  ;
quit;

proc print
  data=barbara1;
run;

proc sql;
  create table barbara2 as
  select 
    age,
    case 
      when age <= 40
        then 'Group 1'
        else 'Group 2'
      end as age_group
  from bailar.encounter
  ;
quit;

proc print
  data=barbara2;
run;

ods pdf close;
