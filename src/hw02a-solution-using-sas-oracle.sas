* hw02a.sas
* written by Steve Simon
* creation date: 2020-01-31;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  Use the database crawling_db. Refer to the page "Data used in this
  module" for a description of the data and where you can download 
  it. Oracle users do not need to download anything.

  1. Read all three fields and all records  
  2. Change Temperature to Temperature_F
  3. Put your code and the output in a single PDF file;

Note: Some of the names used in this code are arbitrary and you can choose whatever names you want. To emphasize which names can be modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is [William Edwards Deming](https://en.wikipedia.org/wiki/W._Edwards_Deming).

ods pdf file="q:/introduction-to-sql/results/hw02a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  deming
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

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
run;

ods pdf close;