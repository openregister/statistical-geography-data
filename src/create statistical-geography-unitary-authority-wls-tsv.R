library(here)
library(tidyverse)
library(readxl)

xl_location <- file.path(here(),"lists","ons","RGC.xlsx")
output_location <- file.path(here(), "data", "statistical-geography-unitary-authority-wls","statistical-geography-unitary-authority-wls.tsv")

# sguaw stands for statistical-geography-unitary-authority-wls

sguaw <- read_excel(xl_location, "W06_UA") %>%
  select("GEOGCD", "GEOGNM", "OPER_DATE", "TERM_DATE") %>%
  rename(`statistical-geography-unitary-authority-wls` = GEOGCD,
         `principal-local-authority` = GEOGNM,
         `start-date` = OPER_DATE,
         `end-date` = TERM_DATE) %>%
  mutate(`start-date` = format(`start-date`, "%Y-%m-%d"),
         `end-date` = format(`end-date`, "%Y-%m-%d"))

write_tsv(sguaw, output_location,
  na = "")
           