* 5508-simon-m02-hw-q02-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-07-24

* Purpose: Answer M02-Q02. Use the cigarettes table in the melange
* database. Find and print all of the records for cigarettes that
* have an ampersand (&) in their name.

* Permissions: This program is placed in the public domain. You can
* use it in any way you see fit without asking for permission.

* Notes: this solution uses SAS and Oracle. An alternate solution using 
* R and SQLite is also available. Some of the names used in this code
* are arbitrary and you can choose whatever names you want. To emphasize
* which names can be modified at your discretion, I am using names of 
* famous statisticians. 

* The statistician being honored in this code is 
* [Reverend Thomas Bayes](https://en.wikipedia.org/wiki/Thomas_Bayes).;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m02-hw-q02-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';

libname
  thomas
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table bayes1 as
    select *
      from thomas.cigarettes
      where BRAND_NAME like "%&%";
quit;

proc print
  data=bayes1;
run;

ods pdf close;
