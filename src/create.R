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

# Create an 'organisation' column.
# For now, this must be manually populated.
codes$organisation <- NA

# Create an end-date column.
# TODO: It should be the date that a code was archived
codes$`end-date` <- NA

# Map area to country/territory/uk registers
mapper <- frame_data(~`area-link`,                     ~`area`,
                        "England",                          NA,
                          "Wales",                          NA,
                       "Scotland",                          NA,
               "Northern Ireland",                          NA,
                 "United Kingdom",                "country:GB",
                  "Great Britain",                          NA,
              "England and Wales",                          NA,
                "Channel Islands", "territory:JE;territory:GG",
                    "Isle of Man",              "territory:IM")

codes <- 
  codes %>%
  left_join(mapper, by = "area-link") %>%
  select(`statistical-geography`,
         name,
         `area`,
         `organisation`,
         `start-date`,
         `end-date`)

# Tweak the formats
codes <- 
  mutate(codes,
         # Use ISO8601 dates
         `start-date` =
           dmy(`start-date`))

# Write the register tsv file, using write.table instead of write_tsv in order
# to quote the 'area' column.  Unfortunately doing so means that the headers are
# all quoted, so the headers are written separately.
cat(paste0(paste(colnames(codes), collapse = "\t"), "\n"),
    file = tsv_path)
write.table(codes,
            tsv_path,
            sep = "\t",
            row.names = FALSE,
            quote = 3,
            col.names = FALSE,
            append = TRUE)
