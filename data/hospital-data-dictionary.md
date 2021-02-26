---
title: "Hospital data dictionary"
author: "Steve Simon"
---

+ Hospital data dictionary
  + This data is a small selection of data from the Health Facts database. There is no private health information, but please do not share this data outside of this class.
  + If you are using Oracle, you need to specify
    + schema=ehr
  + If you are using SQLite, you need to download the file
    + ehr.SQLite from [this page](https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md).
  + You should not need this, but there is a [backup of the data in CSV format](https://github.com/pmean/introduction-to-sql/blob/master/data/hospital.csv).
  + All of the data is stored in a single table named
    + hospital
  + It has 16 records and 6 fields named
    + HOSP_ID
    + CENSUS_REG
    + BED_SIZE
    + TEACHING_IND
    + RURAL_URBAN
    + ACUTE_NONACUTE
