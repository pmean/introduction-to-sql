* hw08a.sas
* written by Steve Simon
* creation date: 2020-07-12;

* Note: this solution uses SAS and Oracle. An alternate solution using 
  R and SQLite is also available.

+ For your homework, use the titanic database.
  + This is available in Oracle using schema='simons'.
  + In SQLite, it is a standalone file named titanic_db.sqlite.
+ Run SQL queries to answer the following 
  + Count the number of passengers with the title "Mr" somewhere in their name.
  + Run a query that counts the number of male and female children (Age <= 18)
  + Run a query that identifies the ages of the youngest and oldest patients in each passenger class.
  + The Survived field has values of 0 (died) and 1 (alive) and an average of this value provides a probability of survival.
  + Calculate this probability for six categories representing the combination of passenger class and sex.
  + Include only those groups where the survival probability is greater than 30%.
+ Place the SQL code and the results of all your queries in a single PDF file.

Note: Some of the names used in this code are arbitrary and you can choose whatever names you want. To emphasize which names can be modified at your discretion, I am using names of famous statisticians.

The statistician being honored in this code is [George W. Snedecor](https://en.wikipedia.org/wiki/George_W._Snedecor).;

ods pdf file="q:/introduction-to-sql/results/hw08a-solution-using-sas-oracle-output.pdf";

%include 'q:/sql files/super-secret.sas';
libname
  snedecor
  oracle
  user='simons'
  password=&pw
  path='@CHIHFPRD, BUFFSIZE=9000'
  schema='simons';

proc sql;
  create table george1 as
  select count(*) as number_of_misters
    from snedecor.titanic
    where name like '% Mr %'
  ;
quit;

proc print
  data=george1;
run;

proc sql;
  create table george2 as
  select sex, count(*) as number_of_children
    from snedecor.titanic
    where age < 18
    group by sex
  ;
quit;

proc print
  data=george2;
run;

proc sql;
  create table george3 as
  select sex, count(*) as number_of_children
    from snedecor.titanic
    where age < 18
    group by sex
  ;
quit;

proc print
  data=george3;
run;

proc sql;
  create table george4 as
  select 
    sex,
    pclass,
    avg(survived) as survival_probability
    from snedecor.titanic
    group by sex, pclass
    having survival_probability > 0.30
  ;
quit;

proc print
  data=george4;
run;

ods pdf close;
