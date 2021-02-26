---
title: "Encounter data dictionary"
author: "Steve Simon"
---

+ Encounter data dictionary
  + This data is a small selection of data from the Health Facts database. There is no private health information, but please do not share this data outside of this class.
  + If you are using Oracle, you need to specify
    + schema=ehr
  + If you are using SQLite, you need to download the file
    + ehr.SQLite from [this page](https://github.com/pmean/introduction-to-sql/blob/master/data/all-data.md).
  + You should not need this, but there is a [backup of the data in CSV format](https://github.com/pmean/introduction-to-sql/blob/master/data/encounter.csv).
  + All of the data is stored in a single table named
    + encounter
  + It has 199 records and 7 fields named
    + Enc_id, (a unique identifier for an encounter)
    + hosp_id (Hospital id), 
    + pat_id (Patient id), 
    + pat_type_id (Patient type id),
    + pay_id (Payer id), 
    + age (age in years), 
    + admission_dt (admission date),
    + discharge_dt (discharge date),
    + Weight (units unknown)
