* hw06a.sas
* written by Steve Simon
* creation date: 2020-07-06

  Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  For your homework, use the hospital database that I mentioned briefly
  earlier in this lecture.

  1. Verify that the hospital id code (HOSP_ID) has no missing values.
  2. There are only two fields in the database that have null values.
  Get a count of the number of missing values for the indicator for
  teaching hospital (TEACHING_IND).
  3. There is only one hospital where the number of beds (BED_SIZE) is
  unknown. Find the id of that hospital.
  4. Combine your results into a single PDF file and submit it.

  Note: Some of the names used in this code are arbitrary and you can 
  choose whatever names you want. To emphasize which names can be 
  modified at your discretion, I am using names of famous 
  statisticians.

  The statistician being honored in this code is 
  [David Blackwell](https://en.wikipedia.org/wiki/David_Blackwell).;

ods pdf file="q:/introduction-to-sql/results/hw06a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  david
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table blackwell1 as
    select
      count(*) as number_missing_ids
      from david.hospital
      where HOSP_ID is null
  ;
quit;

proc print
  data=blackwell1;
run;

proc sql;
  create table blackwell2 as
    select
      count(*) as number_missing_teaching_ind
      from david.hospital
      where TEACHING_IND is null
  ;
quit;

proc print
  data=blackwell2;
run;

proc sql;
  create table blackwell3 as
    select
      HOSP_ID
      from david.hospital
      where BED_SIZE is null
  ;
quit;

proc print
  data=blackwell3;
run;

ods pdf close;
