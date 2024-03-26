library(tidyverse)
library(readxl)
library(here)

here::i_am("codes/data_cleaning.R")

zomato <- read.csv(here::here("data/zomato.csv"), header = T)
country <- readxl::read_xlsx(here::here("data/Country-Code.xlsx"))


zomato %>% 
  left_join(., country, by = c("Country.Code" = "Country Code")) %>%
  select(-c("Country.Code", "Rating.color", "Rating.text")) -> zomato_new

zomato.new[zomato_new$Country == "United States", ] -> zomato_us

saveRDS(zomato_us, file = here::here("output/zomato_us.rds"))
