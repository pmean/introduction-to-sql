* hw07a.sas
* written by Steve Simon
* creation date: 2020-07-06;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

  Your homework

  + Round the value 29.526 to two decimal places.
  + Truncate the value 29.526 to zero decimal places.
  + Calculate the remainder of the value 2500 after it is divided by 500
  + Put your code and output in a single pdf file

Note: Some of the names used in this code are arbitrary and you can choose whatever names you want. To emphasize which names can be modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is [John Tukey](https://en.wikipedia.org/wiki/John_Tukey).;

ods pdf file="q:/introduction-to-sql/results/hw07a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';

proc sql;
  create table john_tukey as
    select
      round(25.926, 2) as rounded_value,
      trunc(25.926, 0) as truncated_value,
      mod(2500, 500) as remainder
      from dual
  ;
quit;

proc print
  data=john_tukey;
run;

ods pdf close;
