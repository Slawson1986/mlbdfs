#' @title Get MLB data from 2015 to the present
#' @name gameday_database_init
#' @description Scrapes the GameDay database and saves output to an SQLite database
#' @export gameday_database_init
#' @param sqlite_db_file a place to write the SQLite database
#' @return NULL

gameday_database_init <- function(sqlite_db_file) {
  connection <- dplyr::src_sqlite(sqlite_db_file, create = TRUE)
  pitchRx::scrape(
    start = "2015-02-01",
    end = Sys.Date() - 1,
    connect = connection$con)
}

#' @title Update GameDay database
#' @name gameday_database_update
#' @description updates the GameDay database
#' @export gameday_database_update
#' @param sqlite_db_file the SQLite database file to update
#' @return NULL

gameday_database_update <- function(sqlite_db_file) {
  connection <- dplyr::src_sqlite(sqlite_db_file, create = FALSE)
  pitchRx::update_db(connect = connection$con)
}
