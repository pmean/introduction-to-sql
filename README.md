# Introduction-to-sql

This is a series of short programs using R Markdown. It 
requires the use of the RSQLite package.

It was run and tested using RStudio and the knitr package.

Use the file with the .Rmd extension as input, or examine the
file with the .html extension to see what the output is like.

There are several files with a sqlite extension. You can create
these files using input-files.Rmd or you can download them
from my github site.

This application does not need any special files beyond the
ones listed above.

Here's a brief description of the key programs, listed in the
order in which they should be viewed.

1. input-files.Rmd, shows how the various sqlite databases 
were created.

2. select-and-where.Rmd, shows how to select all rows, some rows,
and all fields, some fields.

3. summary-statistics.Rmd, shows how to use the COUNT and AVERAGE
functions for a single summary row, and how to use GROUP BY to
get summary statistics for each level of a categorical variable.

4. null-values.Rmd, shows how to select NULL and non-NULL values.

5. category-labels.Rmd, shows how to access category labels that
are stored in a second table in the database.
