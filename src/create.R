# Create a register-shaped dataset in
# data/statistical-geography/statistical-geography.tsv,
# from the raw data.

library(tidyverse)
library(stringr)
library(lubridate)

list_path <- "../lists/ons/RGC_DEC_2016_UK.csv"
tsv_path <- "../data/statistical-geography/statistical-geography.tsv"

# Import the source data
codes <- read_csv(list_path,
                  col_types = "?????????????????_", # ignore trailing comma
                  na = c("", "n/a"))

# Choose the fields for the register
codes <- select(codes, 
                `Entity code`,
                `Entity name`,
                `Entity coverage`,
                `Date entity introduced on RGC`)

# Give the fields register-like names
colnames(codes) <- c("statistical-geography",
                     "name",
                     "area-link",
                     "start-date")

# Create an end-date column.
# TODO: It should be the date that a code was archived
codes$`end-date` <- NA

# Map area to country/territory/uk registers
mapper <- frame_data(~`area-link`,                     ~`area`,
                        "England",                          "",
                          "Wales",                          "",
                       "Scotland",                          "",
               "Northern Ireland",                          "",
                 "United Kingdom",                "country:GB",
                  "Great Britain",                          "",
              "England and Wales",                          "",
                "Channel Islands", "territory:JE;territory:GG",
                    "Isle of Man",              "territory:IM")

codes <- 
  codes %>%
  left_join(mapper, by = "area-link") %>%
  select(`statistical-geography`,
         name,
         `area`,
         `start-date`,
         `end-date`)


# Tweak the formats
codes <- 
  mutate(codes,
         # Use ISO8601 dates
         `start-date` =
           dmy(`start-date`))

# Write the register tsv file
write_tsv(codes, tsv_path, na = "")
