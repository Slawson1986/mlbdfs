read_template <- function(file, contest_date) {
  data_frame <- read.csv(
    file,
    skip = 8,
    encoding = "latin1",
    colClasses = c(
      "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",
      "NULL", "NULL", "NULL", "NULL", "NULL",
      "character", "NULL", "character", "character",
      "numeric", "character", "character"))
  colnames(data_frame) <- c("Position", "Name", "ID", "Salary", "GameInfo", "TeamAbbrev")
  data_frame$contest_date <- contest_date
  return(data_frame)
}
