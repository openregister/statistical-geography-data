# Create a register-shaped dataset in
# data/statistical-geography/statistical-geography.tsv,
# from the raw data.

library(tidyverse)
library(stringr)
library(lubridate)
library(here)

list_path <- file.path(here(), "lists", "ons", "RGC.csv")
tsv_path <- file.path(here(), "data", "statistical-geography", "statistical-geography.tsv")

# Import the source data
# This gives a warning 'Unnamed `col_types` should have the same length as `col_names`. Using smaller of the two'.
# You can safely ignore it -- it's because of a trailing comma in one or more of the rows, which implies a column that doesn't exist.
codes <- read_csv(list_path,
                  #col_types = "?????????????????_", # ignore trailing comma
                  na = c("", "n/a"))

# Choose the fields for the register
codes <- select(codes,
                `Entity code`,
                `Entity name`,
                `Entity coverage`,
                `Entity owner`,
                `Date entity introduced on RGC`)

# Give the fields register-like names
colnames(codes) <- c("statistical-geography",
                     "name",
                     "area_link",
                     "org_link",
                     "start-date")

# Create an end-date column.
# TODO: It should be the date that a code was archived
codes$`end-date` <- NA

# Map area to country/territory/uk registers
area_map <- frame_data(~area_link,                       ~area,
                        "England",                          NA,
                          "Wales",                          NA,
                       "Scotland",                          NA,
               "Northern Ireland",                          NA,
                 "United Kingdom",                "country:GB",
                  "Great Britain",                          NA,
              "England and Wales",                          NA,
                "Channel Islands", "territory:JE;territory:GG",
                    "Isle of Man",              "territory:IM")

# Map organisation to government-organisation register

# Get the government-organisation register and filter for latest entries
organisations <-
  read_tsv("https://government-organisation.register.gov.uk/records.tsv?page-size=5000") %>%
  group_by(key) %>%
  arrange(key, `entry-timestamp`) %>%
  filter(`entry-timestamp` == max(`entry-timestamp`)) %>%
  ungroup() %>%
  rename(organisation = "government-organisation") %>%
  select(organisation, name)

# org_map <-
#   codes %>%
#   distinct(org_link, area_link) %>%
#   mutate(organisation = "government-organisation:") %>%
#   select(org_link, area_link, organisation) %>%
#   arrange(org_link, area_link) %>%
#   deparse(as_tribble = TRUE)
# # Output this line to the console and paste to base new tribble on old.
# cat(org_map)

org_map <- tribble(~org_link, ~area_link, ~organisation,
                   "BCNI", "Northern Ireland", "government-organisation:OT428",
                   "BIS", "England", "government-organisation:D3",
                   "DCLG", "England", "government-organisation:D4",
                   "DCLG", "Wales", "government-organisation:D4",
                   "DEFRA", "England", "government-organisation:D7",
                   "GLA", "England", "local-authority-eng:GLA",
                   "HIE", "Scotland", NA,
                   "Home Office", "England", "government-organisation:D16",
                   "Home Office", "Wales", "government-organisation:D16",
                   "LGBC", "England", NA,
                   "LGBC", "Scotland", NA,
                   "Natural England", "England", "government-organisation:PB202",
                   "NHS", "England", "government-organisation:PB481",
                   "NHS", "Scotland", NA,
                   "NIFRS", "Northern Ireland", NA,
                   "NISRA", "Northern Ireland", "government-organisation:EA701",
                   "NRS", "Scotland", "government-organisation:OT1075",
                   "ODS", "Channel Islands", "government-organisation:PB1202",
                   "ODS", "England", "government-organisation:PB1202",
                   "ODS", "Isle of Man", "government-organisation:PB1202",
                   "ODS", "Wales", "government-organisation:PB1202",
                   "ONS", "Channel Islands", "government-organisation:D303",
                   "ONS", "England", "government-organisation:D303",
                   "ONS", "England and Wales", "government-organisation:D303",
                   "ONS", "Great Britain", "government-organisation:D303",
                   "ONS", "Isle of Man", "government-organisation:D303",
                   "ONS", "Northern Ireland", "government-organisation:D303",
                   "ONS", "Scotland", "government-organisation:D303",
                   "ONS", "United Kingdom", "government-organisation:D303",
                   "ONS", "Wales", "government-organisation:D303",
                   "PHE", "England", "government-organisation:EA480",
                   "PSNI", "Northern Ireland", "government-organisation:OT657",
                   "SE", "Scotland", NA,
                   "SG", "Scotland", "government-organisation:DA1020",
                   "WG", "Wales", "government-organisation:DA1019",
                   "WG (BC)", "Wales", "government-organisation:OT432",
                   "WG (Data Unit)", "Wales", NA,
                   "WG (Econ)", "Wales", NA,
                   "WG (Educ)", "Wales", NA,
                   "WG (Envt)", "Wales", NA,
                   "WG (Health)", "Wales", NA,
                   "WG (LGBC)", "Wales", NA,
                   "WG (Stats)", "Wales", NA)

codes <-
  codes %>%
  left_join(area_map, by = "area_link") %>%
  left_join(org_map, by = c("area_link", "org_link")) %>%
  select(`statistical-geography`,
         name,
         area,
         organisation,
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
            append = TRUE,
            na = "")
