# Create a register-shaped dataset in
# data/statistical-geographic-code/statistical-geographic-code.tsv,
# from the raw data.

library(tidyverse)
library(stringr)
library(lubridate)

list_path <- "../lists/ons/RGC_DEC_2016_UK.csv"
tsv_path <- "../data/statistical-geographic-code/statistical-geographic-code.tsv"

# Import the source data
codes <- read_csv(list_path,
                  col_types = "?????????????????_", # ignore trailing comma
                  na = c("", "n/a"))

# Choose the fields for the register
codes <- select(codes, 
                `Entity code`,
                `Entity name`,
                `Entity abbreviation`,
                `Entity coverage`,
                `Related entity codes`,
                `Entity start date`,
                `Date entity introduced on RGC`)

# Give the fields register-like names
colnames(codes) <- c("statistical-geographic-code",
                     "name",
                     "abbreviation",
                     "geographic-domain",
                     "related-statistical-geographic-code",
                     "statistical-geographic-code-creation-date",
                     "start-date")

# Create an end-date column.
# TODO: It should be the date that a code was archived
codes$`end-date` <- NA

# Tweak the formats
codes <- 
  mutate(codes,
         # Use semicolons as within-field delimiters
         `related-statistical-geographic-code` =
           str_replace_all(`related-statistical-geographic-code`, ", ", ";"),
         # Use ISO8601 dates
         `statistical-geographic-code-creation-date` =
           dmy(`statistical-geographic-code-creation-date`),
         `start-date` =
           dmy(`start-date`))

# Write the register tsv file
write_tsv(codes, tsv_path, na = "")
