project_name <- getwd()
project_name <- "module01-start-here"
src_path <- paste(project_name, "src", sep="/")
res_path <- paste(project_name, "results", sep="/")
doc_path <- paste(project_name, "doc", sep="/")
html_list <- list.files(src_path, pattern="*.html")

display_info <- function(x_list, x_name) {
  cat(length(x_list))
  cat(" ")
  cat(x_name)
    cat(" file(s) moved: ")
  cat(paste(x_list, collapse=", "))
  cat("\n")
}

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

display_info(pdf_list,  "pdf")
display_info(html_list, "html")
display_info(pptx_list, "pptx")
