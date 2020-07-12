* hw02b.sas
* written by Steve Simon
* creation date: 2020-01-31

  Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  Use patient_type table in EHR Datamart. Refer to the page "Data used 
  in this module" for a description of the data and where you can 
  download it. Oracle users do not need to download anything.

  1. Read all fields and  all records
  2. Change Pat_type_desc to Patient_Type_Desc
  3. Put your code and the output in a single PDF file

Note: Some of the names used in this code are arbitrary and you can 
choose whatever names you want. To emphasize which names can be modified 
at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is 
[Gertrude Mary Cox](https://en.wikipedia.org/wiki/Gertrude_Mary_Cox).;

ods pdf file="q:/introduction-to-sql/results/hw02b-solution-using-sas-oracle-output.pdf";

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
    select
      PAT_TYPE_ID,
      PAT_TYPE_DESC as Patient_Type_Desc
  from cox.patient_type;
quit;

proc print
  data=gertrude;
run;

ods pdf close;
