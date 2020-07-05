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


ods pdf file="q:/introduction-to-sql/results/hw02a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  or_link
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

proc sql;
  create table hw02a_sasfile as
    select
      BIRTH_MONTH,
      TEMPERATURE as Temperature_F,
      AVG_CRAWLING_AGE
  from or_link.crawling;
quit;

proc print
  data=hw02a_sasfile;
run;

ods pdf close;
