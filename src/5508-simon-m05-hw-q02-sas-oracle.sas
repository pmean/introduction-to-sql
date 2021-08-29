*************************************************

5508-simon-m05-hw-q02.sas.oracle.sas
Author: Steve Simon
Creation date: 2020-07-12

Note: this solution uses SAS and Oracle. An 
alternate solution using  R and SQLite is also
available.
  
Purpose: Answer M05-Q2. Use the hospital table
in the ehr database. Convert null values of 
teaching_ind to -1 and print the values only 
for  census_reg = "?West".

Hint: Use coalesce function.

Some of the names used in this code are 
arbitrary and you can choose whatever names you
want. To emphasize which names can be modified
at your discretion, I am using names of famous 
statisticians.

The statistician being honored in this code is 
[George Box](https://en.wikipedia.org/wiki/George_E._P._Box).

*************************************************;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m05-hw-q02-sas-oracle.pdf";

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
    census_reg,
    teaching_ind,
    coalesce(teaching_ind, -1) as imputed_value
  from bailar.hospital
  where 
    census_reg='West' and
	monotonic() <= 10
  ;
quit;

proc print
  data=barbara;
  title1 "A listing of data with NULL replaced by -1";
run;

ods pdf close;
