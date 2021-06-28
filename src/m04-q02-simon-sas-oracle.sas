* m04-q02-simon-oracle.sas
* written by Steve Simon
* creation date: 2020-07-12;

* Purpose: To answer M04-Q02. Use the hospital table in the ehr database.
* The variable ACUTE_NONACUTE has the values Acute and Non-Acute. Use 
* the substr function to convert these two values to the first letter
* (A or N). Print out the first ten values only.

* Note: this solution uses SAS and Oracle. An alternate solution using 
* R and SQLite is also available.

* Some of the names used in this code are arbitrary
* and you can choose whatever names you want. To 
* emphasize which names can be modified at your
* discretion, I am using names of famous
* statisticians.

* The statistician being honored in this code is
* [John Tukey](https://en.wikipedia.org/wiki/John_Tukey).;


ods pdf file="q:/introduction-to-sql/results/m04-q02-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  tukey
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table john as
  select substr(acute_nonacute, 1, 1) as letter_code
    from tukey.hospital
    where monotonic() <= 10
  ;
quit;

proc print
  data=john;
run;

ods pdf close;
