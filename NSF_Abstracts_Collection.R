# Install once if needed
install.packages("remotes")
remotes::install_github("ropensci/awardFindR")

library(awardFindR)
library(dplyr)
library(readr)

nsf_raw <- get_nsf(
  keyword = "climate",
  from_date = as.Date("2022-01-01"),
  to_date   = as.Date("2024-12-31")
)

nsf_abstracts <- nsf_raw %>%
  transmute(
    id = id,
    title = title,
    text = abstractText,
    start_date = date,
    amount = estimatedTotalAmt
  ) %>%
  filter(!is.na(text), text != "")

write_csv(nsf_abstracts, "nsf_abstracts.csv")