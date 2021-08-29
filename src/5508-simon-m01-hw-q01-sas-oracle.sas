* 5508-simon-m01-hw-q01-simon-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-01-31

* Purpose: Answer M01-Q01. Use patient_type table in EHR Datamart.
* Read all the fields and all 12 records from this table.

* Permissions: This program is placed in the public domain. You can
* use it in any way you see fit without asking for permission.

* Notes: this solution uses SAS and Oracle. An alternate solution using 
* R and SQLite is also available. Some of the names used in this code
* are arbitrary and you can choose whatever names you want. To emphasize
* which names can be modified at your discretion, I am using names of 
* famous statisticians. The statistician being honored in this code is 
* [Gertrude Mary Cox](https://en.wikipedia.org/wiki/Gertrude_Mary_Cox).;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m01-hw-q01-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  cox
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table gertrude as
    select *
	  from cox.patient_type
quit;

proc print
  data=gertrude;
  title1 "This is a listing of all fields and all 12 records.";
run;

ods pdf close;
