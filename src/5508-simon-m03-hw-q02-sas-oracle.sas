* 5508-simon-m03-hw-q02-sas-oracle.sas
* written by Steve Simon
* creation date: 2020-07-06

* Purpose: Answer M03-Q02. There are only two fields in the database
* that have null values. Get a count of the number of missing values
* for the indicator for teaching hospital (TEACHING_IND).

* Permissions: This program is placed in the public domain. You can
* use it in any way you see fit without asking for permission.

* Notes: this solution uses SAS and Oracle. An alternate solution using 
* R and SQLite is also available. Some of the names used in this code
* are arbitrary and you can choose whatever names you want. To emphasize
* which names can be modified at your discretion, I am using names of 
* famous statisticians. The statistician being honored in this code is 
* [David Blackwell](https://en.wikipedia.org/wiki/David_Blackwell).

;

ods pdf file="q:/introduction-to-sql/results/5508-simon-m03-hw-q02-sas-oracle.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  david
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='ehr';

proc sql;
  create table blackwell as
    select
      count(*) as number_missing_teaching_ind
      from david.hospital
      where TEACHING_IND is null
  ;
quit;

proc print
  data=blackwell;
run;

ods pdf close;
