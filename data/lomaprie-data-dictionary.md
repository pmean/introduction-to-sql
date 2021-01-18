Lomaprie data dictionary

This dataset comes from the OzDASL data repository.

Smyth, GK (2011). Australasian Data and Story Library
(OzDASL). http://www.statsci.org/data.

The copyright statement says that you can "freely
use" this data, but that republication may require
permission from the original copyright holder. The
revised versions I am using (described below) are
produced under the protection of the Fair Use 
provisions of U.S. copyright law.

The data comes from a longitudinal study of depression
that coincided, totally by accident, with a major
earthquake. This provided the opportunity to 
evaluate depression levels two weeks before through
ten weeks after the event.

You can find a description of this dataset at

+ http://www.statsci.org/data/general/lomaprie.html

and the data itself is at

+ http://www.statsci.org/data/general/lomaprie.txt

A modified version of this data with a sequential id
number is stored at

+ https://github.com/classes-medb/5508/blob/master/data/lomaprie.csv

The dataset has 6 fields and 25 records.

+ id, sequence number from 1 to 25
+ Week0, Depression scores 2 weeks before the earthquake
+ Week3, Depression scores one week after the quake
+ Week6, Depression scores 4 weeks after the quake
+ Week9, Depression scores 7 weeks after the quake
+ Week12, Depression scores 10 weeks after the quake

This data is used in MEDB 5508, Introduction to SQL.

It is stored in table named lomaprie in both an Oracle
database and a SQLite database.

If you are accessing the data through Oracle, you do
not need to download anything, as it is stored on the
Insights Platform. Please be sure to specify

+ schema=melange

in your code.

If you are accessing the data through SQLite, you need
to download the file melange.SQLite, available at

+ https://github.com/classes-medb/5508/blob/master/data/melange.SQLite

