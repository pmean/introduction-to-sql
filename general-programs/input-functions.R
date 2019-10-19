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
  dbDisconnect(conn=db)
}
