display_info <- function(x_list, x_name) {
  cat(length(x_list))
  cat(" ")
  cat(x_name)
  cat(" file(s) moved: ")
  cat(paste(x_list, collapse=", "))
  cat("\n")
}

project_name_list <- c(
  "module01-start-here",
  "module02-retrieving-data-using-the-select-statement",
  "module04-sorting-and-restricting-data"
)

for (project_name in project_name_list) {
  src_path <- paste(project_name, "src", sep="/")
  res_path <- paste(project_name, "results", sep="/")
  doc_path <- paste(project_name, "doc", sep="/")
  html_list <- list.files(src_path, pattern="*.html")

  pdf_list <- list.files(src_path, pattern="*.pdf")
  for (i in pdf_list) {
    fn <- paste(src_path, i, sep="/")
    file.copy(fn, res_path, overwrite=TRUE)
    file.remove(fn)
  }

  for (i in html_list) {
    fn <- paste(src_path, i, sep="/")
    file.copy(fn, res_path, overwrite=TRUE)
    file.remove(fn)
  }

  pptx_list <- list.files(src_path, pattern="*.pptx")
  for (i in pptx_list) {
    fn <- paste(src_path, i, sep="/")
    file.copy(fn, res_path, overwrite=TRUE)
    file.remove(fn)
  }
  cat("\n\n", project_name, "\n", sep="")
  print(display_info(pdf_list,  "pdf"))
  print(display_info(html_list, "html"))
  print(display_info(pptx_list, "pptx"))
}