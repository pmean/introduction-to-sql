* hw04a.sas
* written by Steve Simon
* creation date: 2020-07-22

  Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

Use table patient_type in EHR data mart. This table patient_type has 2 fields.

Pat_type_id (Patient Type Id)
Pat_type_desc (Patient Type Desc)
 

Order all the fields by Pat_type_desc
Select all fields where Pat_type_desc starts with "Inp"
Select first four rows from the table

Note: Some of the names used in this code are arbitrary and you can 
choose whatever names you want. To emphasize which names can be 
modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is 
[Florence Nightingale](https://en.wikipedia.org/wiki/Florence_Nightingale).;

ods pdf file="q:/introduction-to-sql/results/hw04a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  florence
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table nightingale1 as
    select *
      from florence.patient_type
      order by Pat_type_desc;
quit;

proc print
  data=nightingale1;
run;

proc sql;
  create table nightingale2 as
    select *
      from florence.patient_type
      where Pat_type_desc like 'Inp%';
quit;

proc print
  data=nightingale2;
run;

proc sql;
  create table nightingale3 as
    select *
      from florence.patient_type
      where monotonic() <= 4;
quit;

proc print
  data=nightingale3;
run;

ods pdf close;
