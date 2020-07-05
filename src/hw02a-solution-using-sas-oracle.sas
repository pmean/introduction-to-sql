* hw02a.sas
* written by Steve Simon
* creation date: 2020-01-31;

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
