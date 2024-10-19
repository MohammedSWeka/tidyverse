### import data 

library(tidyverse)
as_tibble(trees)

##Reading Excel files into R
install.packages("readxl")
library(readxl)
# read example file into R
example <- readxl_example("datasets.xlsx")
df <- read_excel(example)
df

## Reading CSVs into R
## install.packages("readr")
library(readr)

## read CSV into R
df_csv <- read_csv("sample_data - Sheet1.csv")

## look at the object
head(df_csv)

# Exporting Data from R
write_csv(df_csv, path = "my_csv_file.csv")
