suppressMessages(suppressWarnings(library(dplyr)))
suppressMessages(suppressWarnings(library(magrittr)))
suppressMessages(suppressWarnings(library(sqldf)))

add_to_sqlite <- function(rawdata, sqlite_name, table_name) {
  db <- dbConnect(SQLite(), dbname=sqlite_name)
  dbWriteTable(conn=db, name=table_name, value=rawdata,
    overwrite=TRUE, row.names=FALSE, header=TRUE)
  dbDisconnect(conn=db)
  
  db <- dbConnect(SQLite(), dbname=sqlite_name)
  print(dbListTables(conn=db))
  print(dbGetQuery(conn=db, paste0("select * from ", table_name, " limit 5")))
  print(dbGetQuery(conn=db, paste0("select count(*) as n from ", table_name)))
  dbDisconnect(conn=db)
  csv_name <- sub(".sqlite", paste0("_", table_name, ".csv"), sqlite_name)
  write.csv(rawdata, file=csv_name, row.names=FALSE)
}
