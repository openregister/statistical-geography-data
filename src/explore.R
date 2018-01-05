#' This is a first exploration of the data in the spreadsheet from ONS

library(tidyverse)
library(readxl)
library(stringr)

codes_path <- "../lists/ons/RGC_DEC_2016_UK.csv"
spreadsheet_path <- "../lists/ons/RGC_DEC_2016_UK.xlsx"

#' There are 167 rows in the code file
codes <- read_csv(codes_path,
                  col_types = "?????????????????_", # ignore trailing comma
                  na = c("", "n/a"))
# Ignore warning "Missing column names filled in: 'X18' [18]
nrow(codes)

#' Not all codes entered the register immediately
codes %>%
  filter(`Date entity introduced on RGC` != `Entity start date`) %>%
  select(`Date entity introduced on RGC`, `Entity start date`)

#' All the `Related entity codes` exist
# This should produce a data frame with no rows
codes %>%
  select(`Related entity codes`) %>%
  mutate(`Related entity codes` = str_split(`Related entity codes`, ", ")) %>%
  unnest() %>%
  distinct() %>%
  anti_join(codes, by = c("Related entity codes" = "Entity code"))

#' `Entity coverage` distinguishes between `Entity name`s
nrow(codes) # Distinct rows

codes %>%
  distinct(`Entity name`, `Entity coverage`) %>%
  nrow() # Distinct rows using only 'name' and 'coverage' (same as overall distinct)

codes %>%
  distinct(`Entity name`) %>%
  nrow() # Distinct rows using only 'name' and NOT 'coverage' (less than overall)

#' Unique values of `Entity coverage`
table(codes$`Entity coverage`)
#
#   Channel Islands           England England and Wales     Great Britain
#                 2                57                 4                 1
#       Isle of Man  Northern Ireland          Scotland    United Kingdom
#                 3                15                41                 2
#             Wales
#                42

#' There are 122 sheets in the spreadsheet
sheets <- excel_sheets(spreadsheet_path)
length(sheets)

#' Load all the sheets into a list of data frames
all_sheets <-
  sheets %>%
  map( ~ read_excel(spreadsheet_path, sheet = .x))

#' Name each data frame by the name of the sheet
names(all_sheets) <- sheets

#' Drop the "For_Scotland" sheet (it's blank with instructions for finding data)
all_sheets <- keep(all_sheets, sheets != "For_Scotland")

#' Work out which columns are used by which sheets.
#' * 119 sheets have common columns.
#'     - 56 of those additionally have the AREA?HECT columns
#' * One sheet is a table of all the other sheets (RGC)
#' * One sheet is a table of field descriptions of all the other sheets
#'   (Metadata_for_geography_listings)
#' * One sheet was dropped (For_Scotland)
#' So 122 sheets = 119 main data sheets + 3 others

#' How many sheets use each column
all_sheets %>%
  map_df( ~ data_frame(colname = colnames(.x)), .id = "sheet") %>%
  count(colname) %>%
  arrange(desc(n)) %>%
  print(n = Inf)

#' Sheets without the ENTITYCD column
all_sheets %>%
  map_df( ~ data_frame(colname = colnames(.x)), .id = "sheet") %>%
  filter(colname == "ENTITYCD") %>%
  distinct(sheet) %>%
  anti_join(data_frame(sheet = sheets), .)

#' There would be 341,883 records in a combined register of the 119 sheets.
all_sheets %>%
  # Drop the non-data sheets
  keep(!(names(all_sheets) %in% c("RGC", "Metadata_for_geography_listings"))) %>%
  bind_rows()

#' Looking at the RGC tab only
rgc <- read_excel(spreadsheet_path, "RGC")

count(rgc, `Entity theme`) %>%
  arrange(n)

map(rgc, ~ length(unique(.x)))

#' Country has only one record (England)
read_excel(spreadsheet_path, "E92_CTRY")

#' Who are the owners?
table(rgc$`Entity owner`) %>% sort(decreasing = TRUE)
