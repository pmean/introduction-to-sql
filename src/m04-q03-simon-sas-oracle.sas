* m04-q03-simon-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-07-12;

* Purpose: To answer M04-Q03. Use the titanic table in
* the melange database. Run a query that counts the 
* number of male and female children (Age <= 18)

* Note: this solution uses SAS and Oracle. An alternate
* solution using R and SQLite is also available.

Note: Some of the names used in this code are arbitrary and you can choose whatever names you want. To emphasize which names can be modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is [George W. Snedecor](https://en.wikipedia.org/wiki/George_W._Snedecor).;

ods pdf file="q:/introduction-to-sql/results/m04-q03-simon-sas-oracle.pdf";

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
  select sex, count(*) as number_of_children
    from snedecor.titanic
    where age < 18
    group by sex
  ;
quit;

proc print
  data=george;
run;

ods pdf close;
