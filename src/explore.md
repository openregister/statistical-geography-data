This is a first exploration of the data in the spreadsheet from ONS


```r
library(tidyverse)
library(readxl)

codes_path <- "../lists/ons/RGC_DEC_2016_UK.csv"
spreadsheet_path <- "../lists/ons/RGC_DEC_2016_UK.xlsx"
```

There are 167 rows in the code file


```r
codes <- read_csv(codes_path)
```

```
## Warning: Missing column names filled in: 'X18' [18]
```

```
## Parsed with column specification:
## cols(
##   `Entity code` = col_character(),
##   `Entity name` = col_character(),
##   `Entity abbreviation` = col_character(),
##   `Entity theme` = col_character(),
##   `Entity coverage` = col_character(),
##   `Related entity codes` = col_character(),
##   Status = col_character(),
##   `Number of live instances` = col_number(),
##   `Number of archived instances` = col_number(),
##   `Number of cross-border instances` = col_integer(),
##   `Date of last instance change` = col_character(),
##   `Current code (first in range)` = col_character(),
##   `Current code (last in range)` = col_character(),
##   `Reserved code (for CHD use)` = col_character(),
##   `Entity owner` = col_character(),
##   `Date entity introduced on RGC` = col_character(),
##   `Entity start date` = col_character(),
##   X18 = col_character()
## )
```

```r
nrow(codes)
```

```
## [1] 167
```

There are 122 sheets in the spreadsheet


```r
sheets <- excel_sheets(spreadsheet_path)
length(sheets)
```

```
## [1] 122
```

Load all the sheets into a list of data frames


```r
all_sheets <- 
  sheets %>%
  map( ~ read_excel(spreadsheet_path, sheet = .x))
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6783 / R6783C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6783 / R6783C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6784 / R6784C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6784 / R6784C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6785 / R6785C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6785 / R6785C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6786 / R6786C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6786 / R6786C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6787 / R6787C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6787 / R6787C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6788 / R6788C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6788 / R6788C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6789 / R6789C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6789 / R6789C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6790 / R6790C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6790 / R6790C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6791 / R6791C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6791 / R6791C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6792 / R6792C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6792 / R6792C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6793 / R6793C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6793 / R6793C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6794 / R6794C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6794 / R6794C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6795 / R6795C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6795 / R6795C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6796 / R6796C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6796 / R6796C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6797 / R6797C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6797 / R6797C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6798 / R6798C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6798 / R6798C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6799 / R6799C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6799 / R6799C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6800 / R6800C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6800 / R6800C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6801 / R6801C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6801 / R6801C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6802 / R6802C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6802 / R6802C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6803 / R6803C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6803 / R6803C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6804 / R6804C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6804 / R6804C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6805 / R6805C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6805 / R6805C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6806 / R6806C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6806 / R6806C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6807 / R6807C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6807 / R6807C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6808 / R6808C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6808 / R6808C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6809 / R6809C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6809 / R6809C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6810 / R6810C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6810 / R6810C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6811 / R6811C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6811 / R6811C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6812 / R6812C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6812 / R6812C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6813 / R6813C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6813 / R6813C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6814 / R6814C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6814 / R6814C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6815 / R6815C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6815 / R6815C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6816 / R6816C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6816 / R6816C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6817 / R6817C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6817 / R6817C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6818 / R6818C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6818 / R6818C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6819 / R6819C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6819 / R6819C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6820 / R6820C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6820 / R6820C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6821 / R6821C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6821 / R6821C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6822 / R6822C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6822 / R6822C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6823 / R6823C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6823 / R6823C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6824 / R6824C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6824 / R6824C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6825 / R6825C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6825 / R6825C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6826 / R6826C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6826 / R6826C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6827 / R6827C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6827 / R6827C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6828 / R6828C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6828 / R6828C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6829 / R6829C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6829 / R6829C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6830 / R6830C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6830 / R6830C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6831 / R6831C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6831 / R6831C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6832 / R6832C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6832 / R6832C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6833 / R6833C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6833 / R6833C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6834 / R6834C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6834 / R6834C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6835 / R6835C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6835 / R6835C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6836 / R6836C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6836 / R6836C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6837 / R6837C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6837 / R6837C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6838 / R6838C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6838 / R6838C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6839 / R6839C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6839 / R6839C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6840 / R6840C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6840 / R6840C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6841 / R6841C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6841 / R6841C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6842 / R6842C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6842 / R6842C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6843 / R6843C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6843 / R6843C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6844 / R6844C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6844 / R6844C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6845 / R6845C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6845 / R6845C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6846 / R6846C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6846 / R6846C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6847 / R6847C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6847 / R6847C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6848 / R6848C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6848 / R6848C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6849 / R6849C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6849 / R6849C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6850 / R6850C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6850 / R6850C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6851 / R6851C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6851 / R6851C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6852 / R6852C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6852 / R6852C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6853 / R6853C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6853 / R6853C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6854 / R6854C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6854 / R6854C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6855 / R6855C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6855 / R6855C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6856 / R6856C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6856 / R6856C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6857 / R6857C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6857 / R6857C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6858 / R6858C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6858 / R6858C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6859 / R6859C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6859 / R6859C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6860 / R6860C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6860 / R6860C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6861 / R6861C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6861 / R6861C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6862 / R6862C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6862 / R6862C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6863 / R6863C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6863 / R6863C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6864 / R6864C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6864 / R6864C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6865 / R6865C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6865 / R6865C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6866 / R6866C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6866 / R6866C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6867 / R6867C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6867 / R6867C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6868 / R6868C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6868 / R6868C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6869 / R6869C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6869 / R6869C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6870 / R6870C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6870 / R6870C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6871 / R6871C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6871 / R6871C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6872 / R6872C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6872 / R6872C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6873 / R6873C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6873 / R6873C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6874 / R6874C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6874 / R6874C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6875 / R6875C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6875 / R6875C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6876 / R6876C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6876 / R6876C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6877 / R6877C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6877 / R6877C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6878 / R6878C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6878 / R6878C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6879 / R6879C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6879 / R6879C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6880 / R6880C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6880 / R6880C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6881 / R6881C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6881 / R6881C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6882 / R6882C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6882 / R6882C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6883 / R6883C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6883 / R6883C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6884 / R6884C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6884 / R6884C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6885 / R6885C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6885 / R6885C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6886 / R6886C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6886 / R6886C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6887 / R6887C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6887 / R6887C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6888 / R6888C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6888 / R6888C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6889 / R6889C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6889 / R6889C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6890 / R6890C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6890 / R6890C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6891 / R6891C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6891 / R6891C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6892 / R6892C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6892 / R6892C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6893 / R6893C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6893 / R6893C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6894 / R6894C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6894 / R6894C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6895 / R6895C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6895 / R6895C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6896 / R6896C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6896 / R6896C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6897 / R6897C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6897 / R6897C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6898 / R6898C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6898 / R6898C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6899 / R6899C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6899 / R6899C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6900 / R6900C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6900 / R6900C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6901 / R6901C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6901 / R6901C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6902 / R6902C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6902 / R6902C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6903 / R6903C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6903 / R6903C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6904 / R6904C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6904 / R6904C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6905 / R6905C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6905 / R6905C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6906 / R6906C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6906 / R6906C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6907 / R6907C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6907 / R6907C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6908 / R6908C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6908 / R6908C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6909 / R6909C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6909 / R6909C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6910 / R6910C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6910 / R6910C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6911 / R6911C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6911 / R6911C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6912 / R6912C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6912 / R6912C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6913 / R6913C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6913 / R6913C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6914 / R6914C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6914 / R6914C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6915 / R6915C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6915 / R6915C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6916 / R6916C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6916 / R6916C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6917 / R6917C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6917 / R6917C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6918 / R6918C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6918 / R6918C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6919 / R6919C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6919 / R6919C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6920 / R6920C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6920 / R6920C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6921 / R6921C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6921 / R6921C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6922 / R6922C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6922 / R6922C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6923 / R6923C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6923 / R6923C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6924 / R6924C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6924 / R6924C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6925 / R6925C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6925 / R6925C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6926 / R6926C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6926 / R6926C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6927 / R6927C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6927 / R6927C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6928 / R6928C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6928 / R6928C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6929 / R6929C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6929 / R6929C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6930 / R6930C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6930 / R6930C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6931 / R6931C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6931 / R6931C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6932 / R6932C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6932 / R6932C5: got '2011 Census Maintenance'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in D6933 / R6933C4: got '2011/1001'
```

```
## Warning in read_fun(path = path, sheet = sheet, limits = limits, shim =
## shim, : Expecting logical in E6933 / R6933C5: got '2011 Census Maintenance'
```

Name each data frame by the name of the sheet


```r
names(all_sheets) <- sheets
```

Drop the "For_Scotland" sheet (it's blank with instructions for finding data)


```r
all_sheets <- keep(all_sheets, sheets != "For_Scotland")
```

Work out which columns are used by which sheets.
* 119 sheets have common columns.
    - 56 of those additionally have the AREA?HECT columns
* One sheet is a table of all the other sheets (RGC)
* One sheet is a table of field descriptions of all the other sheets
  (Metadata_for_geography_listings)
* One sheet was dropped (For_Scotland)
So 122 sheets = 119 main data sheets + 3 others
How many sheets use each column


```r
all_sheets %>%
  map_df( ~ data_frame(colname = colnames(.x)), .id = "sheet") %>%
  count(colname) %>%
  arrange(desc(n)) %>%
  print(n = Inf)
```

```
## # A tibble: 34 × 2
##                             colname     n
##                               <chr> <int>
## 1                          ENTITYCD   119
## 2                            GEOGCD   119
## 3                            GEOGNM   119
## 4                           GEOGNMW   119
## 5                         OPER_DATE   119
## 6                             OWNER   119
## 7                          PARENTCD   119
## 8                             SI_ID   119
## 9                          SI_TITLE   119
## 10                           STATUS   119
## 11                        TERM_DATE   119
## 12                        AREACHECT    56
## 13                        AREAEHECT    56
## 14                        AREAIHECT    56
## 15                        AREALHECT    56
## 16                        Attribute     1
## 17    Current code (first in range)     1
## 18     Current code (last in range)     1
## 19    Date entity introduced on RGC     1
## 20     Date of last instance change     1
## 21                      Description     1
## 22              Entity abbreviation     1
## 23                      Entity code     1
## 24                  Entity coverage     1
## 25                      Entity name     1
## 26                     Entity owner     1
## 27                Entity start date     1
## 28                     Entity theme     1
## 29     Number of archived instances     1
## 30 Number of cross-border instances     1
## 31         Number of live instances     1
## 32             Related entity codes     1
## 33      Reserved code (for CHD use)     1
## 34                           Status     1
```

Sheets without the ENTITYCD column


```r
all_sheets %>%
  map_df( ~ data_frame(colname = colnames(.x)), .id = "sheet") %>%
  filter(colname == "ENTITYCD") %>%
  distinct(sheet) %>%
  anti_join(data_frame(sheet = sheets), .)
```

```
## Joining, by = "sheet"
```

```
## # A tibble: 3 × 1
##                             sheet
##                             <chr>
## 1                    For_Scotland
## 2 Metadata_for_geography_listings
## 3                             RGC
```

There would be 341,883 records in a combined register of the 119 sheets.


```r
all_sheets %>%
  # Drop the non-data sheets
  keep(!(names(all_sheets) %in% c("RGC", "Metadata_for_geography_listings"))) %>%
  bind_rows()
```

```
## # A tibble: 341,883 × 15
##       GEOGCD GEOGNM GEOGNMW     SI_ID               SI_TITLE  OPER_DATE
##        <chr>  <chr>   <chr>     <chr>                  <chr>     <dttm>
## 1  E00000001   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 2  E00000002   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 3  E00000003   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 4  E00000004   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 5  E00000005   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 6  E00000006   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 7  E00000007   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 8  E00000008   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 9  E00000009   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## 10 E00000010   <NA>    <NA> 1111/1001 GSS re-coding strategy 2009-01-01
## # ... with 341,873 more rows, and 9 more variables: TERM_DATE <dttm>,
## #   PARENTCD <chr>, ENTITYCD <chr>, OWNER <chr>, STATUS <chr>,
## #   AREAEHECT <dbl>, AREACHECT <dbl>, AREAIHECT <dbl>, AREALHECT <dbl>
```

