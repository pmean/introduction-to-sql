* hw02b.sas
* written by Steve Simon
* creation date: 2020-01-31;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  Use patient_type table in EHR Datamart. Refer to the page "Data used 
  in this module" for a description of the data and where you can 
  download it. Oracle users do not need to download anything.

  1. Read all fields and  all records
  2. Change Pat_type_desc to Patient_Type_Desc
  3. Put your code and the output in a single PDF file;


ods pdf file="q:/introduction-to-sql/results/hw02b-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  or_link
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table hw02b_sasfile as
    select
      PAT_TYPE_ID,
      PAT_TYPE_DESC as Patient_Type_Desc
  from or_link.patient_type;
quit;

proc print
  data=hw02b_sasfile;
run;

ods pdf close;
