*************************************************
m07-q03-simon-sas-oracle
author: Steve Simon
creation date: 2020-07-27

purpose: to illustrate answers to homework in 
module07

license: public domain

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.
  
Q3. Display all the pk1 values for patients 64
and older.

Note: Some of the names used in this code are
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified at
your discretion, I am using names of famous
statisticians.

The statistician being honored in this code is 
[Hirotugu Akaike](https://en.wikipedia.org/wiki/Hirotugu_Akaike).
*************************************************;

ods pdf file="q:/introduction-to-sql/results/m07-q03-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  akaike
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table hirotugu_q3 as
      select 
        d.id, 
        d.age, 
        b.pk1
      from akaike.acupuncture_demographics as d
      inner join akaike.acupuncture_baseline_results as b
      on d.id=b.id
      where d.age >= 64
  ;
quit;

proc print
  data=hirotugu_q3;
  title1 "Listing of pk1 values for age >= 64";
run;

ods pdf close;
