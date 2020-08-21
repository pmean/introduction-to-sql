* patient-type-download.sas
* written by Steve Simon
* creation date: 2020-07-05;

* Download the patient_type table from Oracle and create a csv file.;

%let table_name=patient_type;

%include 'q:/sql files/super-secret.sas';
libname
  or_link
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table table_data as
    select *
  from or_link.&table_name;
quit;

proc export
    data=table_data
    dbms=csv
    outfile="q:/introduction-to-sql/data/&table_name._oracle.csv"
  replace;
run;

