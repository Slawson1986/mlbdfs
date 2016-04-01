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

#' @title Install Stattleship client
#' @name install_stattleship
#' @description installs the Stattleship API client from GitHub
#' @export install_stattleship
#' @return NULL

install_stattleship <- function() {
  devtools::install_github("stattleship/stattleship-r")
  return(NULL)
}

#' @title Set Stattleship token
#' @name set_stattleship_token
#' @description The Stattleship API requires a token to work.
#' "set_stattleship_token" reads this token from a user-specified file.
#' See http://developers.stattleship.com.
#' @export set_stattleship_token
#' @param token_file a file with the token
#' @return NULL

set_stattleship_token <- function(token_file) {
  stattleshipR::set_token(scan(token_file, what = "character"))
  return(NULL)
}

#' @title Get Stattleship game logs
#' @name get_stattleship_game_logs
#' @description Fetch all (many pages) Stattleship MLB game logs
#' @export get_stattleship_game_logs
#' @return a Stattleship list of lists with the game logs

get_stattleship_game_logs <- function() {
  return(
    stattleshipR::ss_get_result(
      sport = "baseball", league = "mlb", ep = "game_logs", walk = TRUE))
}

#' @title Get Stattleship team game logs
#' @name get_stattleship_team_game_logs
#' @description Fetch all (many pages) Stattleship MLB team game logs
#' @export get_stattleship_game_logs
#' @return a Stattleship list of lists with the team game logs

get_stattleship_team_game_logs <- function() {
  return(
    stattleshipR::ss_get_result(
      sport = "baseball", league = "mlb", ep = "team_game_logs", walk = TRUE))
}
