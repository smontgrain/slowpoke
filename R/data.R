#' Load bundled Pokémon TCG dataset
#'
#' @return A tibble containing Pokémon TCG data.
#' @importFrom arrow read_parquet
#' @export
load_data <- function() {
  path <- system.file("extdata", "pokemon_cards.parquet", package = "slowpoke")

  arrow::read_parquet(path)
}
