* 5508-simon-m04-hw-q04-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-07-12;

* Purpose: To answer M04-Q04. Use the titanic table
* in the melange database. Run a query that 
* identifies the ages of the youngest and oldest
* patients in each passenger class.

* Note: this solution uses SAS and Oracle. An alternate
* solution using R and SQLite is also available.

* Some of the names used in this code are arbitrary and
* you can choose whatever names you want. To emphasize
* which names can be modified at your discretion, I am 
* using names of famous statisticians.

* The statistician being honored in this code is 
* [George W. Snedecor](https://en.wikipedia.org/wiki/George_W._Snedecor).;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m04-hw-q04-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  snedecor
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';

proc sql;
  create table george as
  select 
    PClass,
	min(age) as youngest,
	max(age) as oldest
  from snedecor.titanic
  group by PClass
  ;
quit;

proc print
  data=george;
run;

ods pdf close;
