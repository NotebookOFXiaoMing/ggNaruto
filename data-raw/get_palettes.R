## code to prepare `DATASET` dataset goes here

naruto_palettes <- yaml::read_yaml(file = system.file("extdata","naruto_palettes.yml",package = "ggNaruto"))

naruto_palettes <- lapply(naruto_palettes,prismatic::colour)

usethis::use_data(naruto_palettes, overwrite = TRUE)
