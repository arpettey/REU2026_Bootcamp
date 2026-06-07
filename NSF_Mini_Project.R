##### R Script to read in NSF abstract data and create some covariates
##### REU Boot Camp Summer 2026

library(readr)

nsf_abstracts <- read_csv("nsf_abstracts.csv")

## Create a variable for year
library(lubridate)

nsf_abstracts <- nsf_abstracts %>%
  mutate(
    start_date = mdy(start_date),
    year = year(start_date)
  )
table(nsf_abstracts$year)

## Create a variable for award size
nsf_abstracts$amount_group <- ifelse(
  nsf_abstracts$amount > median(nsf_abstracts$amount, na.rm = TRUE),
  "large",
  "small"
)

## Now look at results of LDA and/or STM. What topics are prevalent and how 
## do they change by year?

