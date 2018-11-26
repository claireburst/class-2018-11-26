library(tidyverse)
library(readxl)
library(janitor)

## Step 1

raw1 <- read_excel("Nov18CVRExportRaw-1.xlsx")
raw2 <- read_excel("Nov18CVRExportRaw-2.xlsx")
raw3 <- read_excel("Nov18CVRExportRaw-3.xlsx")

all <- bind_rows(raw1, raw2, raw3) %>%
  clean_names() %>%
  rename(choice_1 = rep_to_congress_1st_choice_district_2,
         choice_2 = rep_to_congress_2nd_choice_district_2,
         choice_3 = rep_to_congress_3rd_choice_district_2,
         choice_4 = rep_to_congress_4th_choice_district_2,
         choice_5 = rep_to_congress_5th_choice_district_2,
         vote = cast_vote_record) %>%
  arrange(precinct) %>%
  mutate(vote_id = row_number())



## Step 2
x <- read_rds("tibble_1.rds")

x %>%
  select(vode_id, precinct, ballot_style)

## Step 3

