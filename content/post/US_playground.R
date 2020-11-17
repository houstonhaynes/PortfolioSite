library(tidyverse)
library(zoo)
library(tidycovid19)
library(lubridate)
library(zoo)
library(slider)

counties <- read.csv("./data/us_county.csv", header = TRUE)

counties <-
  counties %>%
  mutate(fips = str_pad(fips, 5, side = 'left', pad = '0'))

counties

county_pop <- select(counties, fips, state, population)

county_pop

US_COVID_data <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/live/us-counties.csv"

us_data <- read.csv(US_COVID_data)

us_data

mask_URL <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/mask-use/mask-use-by-county.csv"

mask_data <- read.csv(mask_URL)

  

mask_data <- 
  mask_data %>%
  mutate(COUNTYFP = str_pad(COUNTYFP, 5, side = 'left', pad = '0'))  %>%
  select(COUNTYFP, NEVER, RARELY, SOMETIMES, FREQUENTLY, ALWAYS) %>%
  rename(fips = COUNTYFP)
  left_join(county_pop, fips = fips)
  
glimpse(mask_data)

us_data_map <- 
  us_data %>%
  filter(fips != "") %>%
  mutate(date = ymd(date)) %>%
  mutate(fips = str_pad(fips, 5, side = 'left', pad = '0')) %>%
  select(date, fips, state, county, cases, deaths)  %>%
  left_join(county_pop, fips = fips) %>%
  arrange(fips, date) %>%
  mutate(ncpht = ((cases / population) * 100000)) %>%
  mutate(ndpht = ((deaths / population) * 100000)) %>%
  ungroup() %>%
  group_by(state)
  
datatable(us_data_map)

glimpse(mask_data)
 
#us_data

hcmap("countries/us/us-all-all",
      data = mask_data,
      value = "ALWAYS",
      name = "Percentage that always wears masks in public",
      join = "fips") %>%
  hc_colorAxis(minColor = "white", maxColor = "#32644F") %>% 
  hc_tooltip(pointFormat = "{point.y}%")

hcmap("countries/us/us-all-all",
      data = us_data_map,
      value = "ncpht",
      group = "state",
      join = "fips",
      name = "Cumulative Cases per 100 000",
      #dataLabels = list(enabled = TRUE, format = "{point.county}"),
      tooltip = list(pointFormat = "{point.county} County: {point.x}")) %>%
  hc_colorAxis(minColor = "white", maxColor = "#800000") %>%
  hc_plotOptions(column = list(stacking = "normal", 
                                  pointPadding = 0, 
                                  groupPadding = 0, 
                                  borderWidth = 0))
