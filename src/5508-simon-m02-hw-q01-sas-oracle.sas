* 5508-simon-m02-hw-q01-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-07-22

* Purpose: Answer M02-Q01. Use table patient_type table in the EHR
* data mart. Order all the fields by Pat_type_desc and print just
* the first four rows from the table. Please note that if you are
* using SAS to access a SQL database, you need to use the keyword
* monotonic.

* Permissions: This program is placed in the public domain. You can
* use it in any way you see fit without asking for permission.

* Notes: this solution uses SAS and Oracle. An alternate solution using 
* R and SQLite is also available. Some of the names used in this code
* are arbitrary and you can choose whatever names you want. To emphasize
* which names can be modified at your discretion, I am using names of 
* famous statisticians. The statistician being honored in this code is 
* [Florence Nightingale](https://en.wikipedia.org/wiki/Florence_Nightingale).;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m02-hw-q01-sas-oracle.pdf";

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
	  where monotonic() <= 4
      order by Pat_type_desc;
quit;

proc print
  data=nightingale1;
  title1 "Here are the first four rows, ordered by Pat_type_desc";
run;

ods pdf close;
