# 0. utilities ------------------------------------------------------------------------------------
any_column_NA <- function(x) {any(is.na(x))}
replace_NA_0 <- function(x) {ifelse(is.na(x), 0, x)}

# 1.libraries ----------------------------------------------------------------------------------
libs_sample <- libs <- c("dplyr", "lubridate", "ChainLadder", "schoolmath", "magrittr", "readxl", "tidyverse", "openxlsx", 
                         "shiny", "shinydashboard", "shinythemes", "DT", "flexdashboard", "ggplot2", "plotly", "shiny", 
                         "shinydashboard", "shinydashboardPlus", "shinyWidgets", "shinyalert", "shinycssloaders",
                         "shinyjs", "shinyBS", "DT", "data.table", "plotly", "tidyverse", "openxlsx", 
                         "doParallel", "foreach", "textclean", "rpivotTable", "tibble", "jsonlite", "xml2", "httr", "stringr", "rvest")

libs_install <- function(libs){
  if (!missing(libs)) {
    libs_ <- libs
  }
  install_ <- install.packages(libs_, dependencies = TRUE)
  return(install_)
}
libs_load <- function(libs){
  if (!missing(libs)) {
    libs_ <- libs
  }
  lib_diff <- setdiff(libs_, installed.packages()[,1])
  if (length(lib_diff) != 0) {
    libs_install(libs = lib_diff)
  }
  lib_diff_test <- setdiff(lib_diff, installed.packages()[,1])
  if (length(lib_diff_test) == 0) {
    libs_return <- invisible(lapply(libs_, library, character.only = TRUE))
    return(libs_return)
  } else {
    return(print("Please check the following libraries: ", lib_diff_test))
  }
}
