* hw06a.sas
* written by Steve Simon
* creation date: 2020-07-06;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  For your homework, use the hospital database that I mentioned briefly
  earlier in this lecture.

  1. Verify that the hospital id code (HOSP_ID) has no missing values.
  2. There are only two fields in the database that have null values.
  Get a count of the number of missing values for the indicator for
  teaching hospital (TEACHING_IND).
  3. There is only one hospital where the number of beds (BED_SIZE) is
  unknown. Find the id of that hospital.
  4. Combine your results into a single PDF file and submit it.;

ods pdf file="q:/introduction-to-sql/results/hw06a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  or_link
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table q1 as
    select
      count(*) as number_missing_ids
      from or_link.hospital
      where HOSP_ID is null
  ;
quit;

proc print
  data=q1;
run;

proc sql;
  create table q2 as
    select
      count(*) as number_missing_teaching_ind
      from or_link.hospital
      where TEACHING_IND is null
  ;
quit;

proc print
  data=q2;
run;

proc sql;
  create table q3 as
    select
      HOSP_ID
      from or_link.hospital
      where BED_SIZE is null
  ;
quit;

proc print
  data=q3;
run;

ods pdf close;
