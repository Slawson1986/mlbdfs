#' @title Get MLB data from 2015 to the present
#' @name database_init
#' @description Scrapes the GameDay database and saves output to an SQLite database
#' @export database_init
#' @param sqlite_db_file a place to write the SQLite database
#' @return NULL

database_init <- function(sqlite_db_file) {
  connection <- dplyr::src_sqlite(sqlite_db_file, create = TRUE)
  suffix_all <-  c(
    "players.xml",
    "miniscoreboard.xml",
    "inning/inning_all.xml",
    "inning/inning_hit.xml")
  pitchRx::scrape(
    start = "2015-02-01",
    end = Sys.Date(),
    connect = connection$con,
    suffix = suffix_all)
}
