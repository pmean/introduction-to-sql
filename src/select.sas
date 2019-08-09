options papersize=(8in 4in) nodate;
proc printto log="select.log" new; run;

ods pdf
  file="select.pdf";

* select.sas
  written by Steve Simon
  2019-08-08;

********* ********* ********* *********
1. Introduction

This program shows how to use the 
SELECT statement for SQL within a SAS
program. The first example shows how
to select an entire table (all records
and all fields).
********* ********* ********* *********;

libname sql_lib odbc
  datasrc='sqlite3';
proc sql;
  select * 
    from sql_lib.airlines_table;
quit;

********* ********* ********* *********
2. This is how you select a single 
field.
********* ********* ********* *********;

proc sql;
  select Airline 
    from sql_lib.airlines_table;
quit;

********* ********* ********* *********
3. This is how you select a multiple
fields.
********* ********* ********* *********;

proc sql;
  select Airline, r2017, r2016 
    from sql_lib.airlines_table;
quit;

********* ********* ********* *********
4. This is how you rename fields.
********* ********* ********* *********;

proc sql;
  select 
    Airline, 
    r2017 as current_rate, 
    r2016 as previous_rate
    from airlines_table
quit;

********* ********* ********* *********;

proc printto; run;

ods pdf close;


