#' Find Pokémon by name pattern
#'
#' @param poke_name A character string to match against Pokémon names.
#' @return A tibble of matching Pokémon card names and their flavor text.
#' @importFrom dplyr filter select distinct
#' @importFrom stringr str_detect str_to_title
#' @export
find_poke <- function(poke_name, dat = load_data()) {

  poke_name <- str_to_title(poke_name)

  dat |>
    filter(str_detect(name, poke_name)) |>
    select(name, flavorText) |>
    distinct()

}

#' Find multiple Pokémon by name patterns
#'
#' @param poke_names A character vector of name patterns.
#' @importFrom dplyr distinct
#' @importFrom purrr map_dfr
#' @return A tibble of matching Pokémon card names and flavor text.
#' @export
find_many_pokes <- function(poke_names, dat = load_data()) {

  purrr::map_dfr(
    poke_names,
    ~ find_poke(.x, dat = dat)
  ) |>
    dplyr::distinct()
}

