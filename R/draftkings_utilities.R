#' @title Read DraftKings lineup template
#' @name read_template
#' @description DraftKings provides a lineup template for each slate of games.
#' This function extracts the player data from that template.
#' @export read_template
#' @param file a DraftKings lineup template file
#' @param contest_date the date of the contest (character, 'yyyy-mm-dd')
#' @return a data frame with the player data

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
  colnames(data_frame) <-
    c("Position", "Name", "ID", "Salary", "GameInfo", "TeamAbbrev")
  data_frame$contest_date <- contest_date
  return(data_frame)
}
