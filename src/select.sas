options papersize=(8in 4in) nodate nolabel;
proc printto log="select.log" new; run;

ods pdf
  file="select.pdf";

* select.sas
  written by Steve Simon
  2019-08-08;

********* ********* ********* *********
Select entire table in SAS

This program shows how to use the 
SELECT statement for SQL within a SAS
program. The first example shows how
to select an entire table (all records
and all fields).

First you need to point
to the database with a libname 
statement. Then you insert the code 
into proc sql.

By default, proc sql will just display
the results of your query. To save a
file for further work, use the create
table as statement.

Notice that proc sql requires a quit
statement rather than a run statement
at the end.
********* ********* ********* *********;

libname sql_lib odbc
  datasrc='sqlite3';
proc sql;
  create table full_table as
  select * 
    from sql_lib.airlines_table;
quit;
proc print
    data=full_table;
run;

********* ********* ********* *********
Select a single field in SAS

This is how you select a single 
field in SAS.

As before, place the SQL query inside 
proc sql and use the create table as
statement to store the results in a SAS
data set.

Watch your semicolons carefully in 
SAS!
********* ********* ********* *********;

proc sql;
  create table single_column as
  select Airline 
    from sql_lib.airlines_table;
quit;
proc print
    data=single_column;
run;

********* ********* ********* *********
Select a multiple fields in SAS

This is how you select multiple fields.
********* ********* ********* *********;

proc sql;
  create table multiple_columns as
  select Airline, r2017, r2016 
    from sql_lib.airlines_table;
quit;
proc print
    data=multiple_columns;
run;

********* ********* ********* *********
Renaming fields

You can rename fields in proc sql, but
be careful. Sometimes SAS retains the 
original name as the variable label.
If you have trouble with renaming, you
may want to do the renaming in SAS 
itself.
********* ********* ********* *********;

proc sql;
  create table renamed_fields as
  select
    Airline,  
    r2017 as current_rate, 
    r2016 as previous_rate
    from sql_lib.airlines_table;
quit;
proc print
    data=renamed_fields;
run;

********* ********* ********* *********;

proc printto; run;

ods pdf close;


