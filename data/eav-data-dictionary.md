eav data dictionary

This dataset comes from the Journal of Statistics
Education data repository.

The copyright statement is unclear but seems to
imply that the author of the article associated 
with any data set retains copyright for that data.
The original and revised versions I am using 
(described below) are produced under the protection
of the Fair Use provisions of U.S. copyright law.

The data represents forced expiratory volume (FEV)
measurements on children between the ages of
3 to 19.

You can find a description of this dataset at

+ http://jse.amstat.org/datasets/fev.txt

and the data itself is at

+ http://jse.amstat.org/datasets/fev.dat.txt
    
A modified version of this data reworked into
an entity-attribute-value format is stored at
    
+ https://github.com/classes-medb/5508/blob/master/data/eav.csv

The dataset has 3 fields and 84 records.

+ entity
+ attribute
+ value

This data is used in MEDB 5508, Introduction to SQL.

It is stored in table named eav in both an Oracle
database and a SQLite database.

If you are accessing the data through Oracle, you do
not need to download anything, as it is stored on the
Insights Platform. Please be sure to specify

+ schema=melange

in your code.

If you are accessing the data through SQLite, you need
to download the file melange.SQLite, available at

+ https://github.com/classes-medb/5508/blob/master/data/melange.SQLite

