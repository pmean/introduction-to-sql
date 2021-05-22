* hw10a.sas
  written by Steve Simon
  creation date: 2020-07-12;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  Note: Some of the names used in this code are arbitrary and you can 
  choose whatever names you want. To emphasize which names can be 
  modified at your discretion, I am using names of famous 
  statisticians.

  The statistician being honored in this code is 
  [George Box](https://en.wikipedia.org/wiki/George_E._P._Box).

  1. Pick a database (any database)
    +	Use one of the approaches shown above to list all the table names.

  2. Pick a table (any table)
    +	Use one of the approaches shown above to list all the field names.

  3. Do an Internet search on a database other than Oracle and SQLite.
    +	Document how you get a list of all the table names in that database.

  Answer to #3: I ran a search on the phrase "db2 list all table names" 
  and found a web page

  https://chartio.com/resources/tutorials/how-to-list-tables-in-ibm-db2/

  Tne information about every table in db2 is listed in a table called 
  SYSIBM.SYSTABLES. Use the following SQL statements:

  SELECT * FROM SYSIBM.SYSTABLES
  WHERE type = "T"
;

ods pdf file="q:/introduction-to-sql/results/hw10a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  box
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='sys';

proc sql;
  create table george1 as
    select table_name
      from box.all_tables 
      where owner='EHR'
;
quit;

proc print
  data=george1;
run;

proc sql;
  create table george2 as
  select column_name
    from box.all_tab_columns 
	where table_name='acupuncture'
;
quit;

proc print
  data=george2;
run;

ods pdf close;
