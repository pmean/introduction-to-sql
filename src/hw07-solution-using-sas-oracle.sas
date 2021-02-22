* hw07.sas
* written by Steve Simon
* creation date: 2021-02-22;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

Note: Some of the names used in this code are arbitrary and you can choose whatever names you want. To emphasize which names can be modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is [John Tukey](https://en.wikipedia.org/wiki/John_Tukey).;

ods pdf file="N:/home/s/simons/introduction-to-sql/results/hw07-solution-using-sas-oracle-output.pdf";

%include 'N:/home/s/simons/sql files/super-secret.sas';
libname
  tukey1
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='melange';


proc sql;
  create table john1 as
    select
      weight_g, round(weight_g, 0.01) as rounded_weight
    from tukey1.cigarettes
  ;
quit;

proc print
  data=john1;
run;

libname
  tukey2
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';


proc sql;
  create table john2 as
    select
      substr(ACUTE_NONACUTE, 1, 1) as single_letter_code
    from tukey2.hospital
    where monotonic() <= 10
  ;
quit;

proc print
  data=john2;
run;

proc sql;
  create table john3 as
    select
      lower(PAT_TYPE_DESC) as description_lower_case
    from tukey2.patient_type
    where monotonic() <= 10
  ;
quit;

proc print
  data=john3;
run;

ods pdf close;
