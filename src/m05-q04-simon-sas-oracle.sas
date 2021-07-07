*************************************************

m05-q04-simon-sas-oracle.sas
Author: Steve Simon
Creation date: 2021-07-01

Note: this solution uses SAS and Oracle. An 
alternate solution using R and SQLite is also
available.
  
Purpose: Answer M05-Q04. Use the melange database
and write a SQL query that will list all the 
field names in the crawling table.

Some of the names used in this code are arbitrary
and you can choose whatever names you want. To
emphasize which names can be modified at your
discretion, I am using names of famous 
statisticians.

The statistician being honored in this code is 
[George Box](https://en.wikipedia.org/wiki/George_E._P._Box).

*************************************************;

ods pdf file="q:/introduction-to-sql/results/m05-q04-simon-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  box
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='sys';

proc sql;
  create table george as
  select column_name
    from box.all_tab_columns 
	where table_name='CRAWLING'
;
quit;

proc print
  data=george;
  title1 "List of all fields in crawling table";
run;

ods pdf close;
