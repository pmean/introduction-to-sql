* m03-q03-simon-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-07-06

* Purpose: This program provides the answers to homework in m03-q03
* of MEDB 5508, Introduction to SQL, where you were asked to find 
* the hospital with a missing bed size.

* Permissions: This program is placed in the public domain. You can
* use it in any way you see fit without asking for permission.

* Notes: this solution uses SAS and Oracle. An alternate solution using 
* R and SQLite is also available. Some of the names used in this code
* are arbitrary and you can choose whatever names you want. To emphasize
* which names can be modified at your discretion, I am using names of 
* famous statisticians.   The statistician being honored in this code is 
* [David Blackwell](https://en.wikipedia.org/wiki/David_Blackwell).

* M03-Q03. There is only one hospital where the number of beds (BED_SIZE)
* is unknown. Find the id of that hospital.;

ods pdf file="q:/introduction-to-sql/results/hw06-solution-using-sas-oracle-output.pdf";

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
