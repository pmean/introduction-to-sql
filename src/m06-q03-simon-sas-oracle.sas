*************************************************

m06-q03-simon-sas-oracle.sas
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

3. Get a count of the numbers of males and females
where you restrict age to be less than 40. Use the
label for sex, but convert it to all uppercase.

*************************************************;

ods pdf file="q:/introduction-to-sql/results/m06-q03-simon-sas-oracle.pdf";



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
    select 
        upper(s.sex_label) as gender,
        count(*) as n
      from hogg.acupuncture_demographics as d
      join hogg.acupuncture_sex_labels as s
        on d.sex=s.sex_code
      where d.age < 40
      group by gender
  ;
quit;

proc print
  data=robert;
run;

ods pdf close;
