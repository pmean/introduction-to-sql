* hw02-01.sas
* written by Steve Simon
* creation date: 2020-01-31

  Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  Use patient_type table in EHR Datamart. Refer to the page "Data used
  in this module" for a description of the data and where you can 
  download it. Oracle users do not need to download anything, but do
  need to use schema=ehr in their code. Read all the fields and all
  the records from this table.

Note: Some of the names used in this code are arbitrary and you can 
choose whatever names you want. To emphasize which names can be modified 
at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is 
[Gertrude Mary Cox](https://en.wikipedia.org/wiki/Gertrude_Mary_Cox).;

ods pdf file="q:/introduction-to-sql/results/hw02-01-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  cox
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table gertrude as
    select *
    from cox.patient_type;
quit;

proc print
  data=gertrude;
run;

ods pdf close;
