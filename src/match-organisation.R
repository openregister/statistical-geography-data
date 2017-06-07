# Fuzzy-match to the government-organisation register

# This doesn't work because e.g. the LGBC (local government boundary commission)
# has different records for England, Wales, Scotland and Northern Ireland, and
# we don't know which one without also looking at the 'area'.

library(tidyverse)
library(fuzzyjoin)

list_path <- "../lists/ons/RGC_DEC_2016_UK.csv"

# Import the source data
codes <- read_csv(list_path,
                  col_types = "?????????????????_", # ignore trailing comma
                  na = c("", "n/a"))

# Choose the fields for the register
codes %>%
  rename(name = `Entity owner`) %>%
  select(name) %>%
  distinct() %>%
  arrange(name) %>%
  mutate(`government-organisation` = NA) %>%
  write_csv("./government-organisation-link.csv", na = "")

# Get the government-organisation register and filter for latest entries
organisations <- 
  read_tsv("https://government-organisation.register.gov.uk/records.tsv?page-size=5000") %>%
  group_by(key) %>%
  arrange(key, `entry-timestamp`) %>%
  filter(`entry-timestamp` == max(`entry-timestamp`)) %>%
  ungroup() %>%
  rename(organisation = "government-organisation") %>%
  select(organisation, name)

stringdist_left_join(codes, 
