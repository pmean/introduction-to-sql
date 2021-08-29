* 5508-simon-m04-hw-q01-sas-oracle.sas
* written by Steve Simon
* creation date: 2021-02-22;

* Purpose: To answer M04-Q01. Use the cigarettes 
* table in the melange database. The variable 
* weight_g is recorded to four decimal places. 
* Round all the values to two decimal places
* and display them.

* Note: this solution uses SAS and Oracle. An 
* alternate solution using R and SQLite is also
* available.

* Note: Some of the names used in this code are
* arbitrary and you can choose whatever names you
* want. To emphasize which names can be modified
* at your discretion, I am using names of famous
* statisticians.

* The statistician being honored in this code is
* [John Tukey](https://en.wikipedia.org/wiki/John_Tukey).;

ods pdf file="q:/introduction-to-sql/5508-simon-m04-hw-q01-sas-oracle.pdf";

%include "q:/sql files/super-secret.sas";

libname
  tukey
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';


proc sql;
  create table john as
    select
      weight_g,
      round(weight_g, 0.01) as rounded_weight
    from tukey.cigarettes
  ;
quit;

proc print
  data=john;
run;

ods pdf close;
