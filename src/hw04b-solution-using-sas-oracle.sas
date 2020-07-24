* hw04b.sas
* written by Steve Simon
* creation date: 2020-07-24

  Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

Use the cigarettes database. This database has a single table, cigarettes with information on

+ Tar, nicotine, and carbon monoxide levels (mg)
+ Weight of cigarette in grams

You can find a [description of this data set](http://jse.amstat.org/datasets/cigarettes.txt) at the Journal of Statistics Education website.

1. Find and print the records for cigarettes that have an ampersand (&) in their name
2. Find and print the records for cigarettes that are a single word brand name (no spaces)

Put your code and output in a single pdf file

Note: Some of the names used in this code are arbitrary and you can 
choose whatever names you want. To emphasize which names can be 
modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is 
[Reverend Thomas Bayes](https://en.wikipedia.org/wiki/Thomas_Bayes).;

ods pdf file="q:/introduction-to-sql/results/hw04b-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';

libname
  thomas
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

proc sql;
  create table bayes1 as
    select *
      from thomas.cigarettes
      where BRAND like "%&%";
quit;

proc print
  data=bayes1;
run;

proc sql;
  create table bayes2 as
    select *
      from thomas.cigarettes
      where BRAND not like "% %";
quit;

proc print
  data=bayes2;
run;

ods pdf close;
