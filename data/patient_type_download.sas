* patient-type-download.sas
* written by Steve Simon
* creation date: 2020-07-05;

* Download the patient_type table from Oracle and create a csv file.;

%include 'q:/sql files/super-secret.sas';
libname
  or_link
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table patient_type as
    select *
  from or_link.patient_type;
quit;

proc export
    data=patient_type
    dbms=csv
    outfile="q:/introduction-to-sql/data/patient_type.csv"
  replace;
run;

