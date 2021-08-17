* m01-q02-simon-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-01-31

* Purpose: Answer M01-Q02. Use the crawling table in the melange
* datamart. Run a query that changes Temperature to Temperature_F 
* and displays all three fields and all records.

* Permissions: This program is placed in the public domain. You can
* use it in any way you see fit without asking for permission.

* Notes: this solution uses SAS and Oracle. An alternate solution using 
* R and SQLite is also available. Some of the names used in this code
* are arbitrary and you can choose whatever names you want. To emphasize
* which names can be modified at your discretion, I am using names of
* famous statisticians. The statistician being honored in this code is 
* [William Edwards Deming](https://en.wikipedia.org/wiki/W._Edwards_Deming).;

ods pdf file="q:/introduction-to-sql/results/m01-q02-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  deming
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table edwards as
    select
      BIRTH_MONTH,
      TEMPERATURE as Temperature_F,
      AVG_CRAWLING_AGE
  from deming.crawling;
quit;

proc print
  data=edwards;
  title1 "This is a listing of all three fields and all records.";
run;

ods pdf close;
