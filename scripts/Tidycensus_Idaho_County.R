## INSTALL PACKAGES

#install.packages('tidyverse')
library(tidyverse)
#install.packages('tidycensus')
# more info about `tidycensus` at https://cran.r-project.org/web/packages/tidycensus/tidycensus.pdf
library(tidycensus)

## USEFUL TUTORIAL(s) FOR `tidycensus`

# https://www.youtube.com/watch?v=MDyGuWrBC-M (time: 3:54)
# Sign up for Census API Key:
# census_api_key('YOUR KEY GOES HERE', install = TRUE)

# https://www.youtube.com/watch?v=i09Pc7orAYg (time: 2:30)
# Geographic subsets
# example: 
#texas_income <- get_acs(geography = 'county',
#                        variables = c(hincome = 'B19013_001'),
#                        state = 'TX')
# example: 
#get_acs(geography = 'county',
#        variables = c(hincome = 'B19013_001',
#                       medage = 'B01002_001'),
#        state = 'TX',
#        output= 'wide')

# https://www.youtube.com/watch?v=dJRoubBvyq4 (time: 3:10)
#v16 <- load_variables(year = 2016,
#                      dataset = 'acs5',
#                      cache = TRUE)
#v16

## BEGIN

# Requesting API Key: https://api.census.gov/data/key_signup.html
# Your request for a new API key has been successfully submitted. Please check your email.
# In a few minutes you should receive a message with instructions on how to activate your new key.

# Hello!
#   Thank you for your interest in the Census Data API. Your API key is a9b21a4543555427e4baba7990a008f87d07a14c. Please click here to activate your key.
# Save this email for future reference.
# Have Fun,
# The Census Bureau API Team
# Follow @uscensusbureau on twitter for API updates.

# Congratulations! Your key has been activated. You may now use it to query the Data API.
# Happy querying!

census_api_key('a9b21a4543555427e4baba7990a008f87d07a14c', overwrite = TRUE, install = TRUE)
readRenviron("~/.Renviron")
Sys.getenv("CENSUS_API_KEY")

# https://walker-data.com/tidycensus/reference/get_estimates.html
# https://walker-data.com/tidycensus/reference/get_acs.html

# For legal entities
Idaho_County_Population = get_estimates(
  geography = 'county',
  product = 'population',
  variables = NULL,
  breakdown = "characteristics",
  breakdown_labels = TRUE,
  year = 2019,
  state = 'ID',
  #county = NULL,
  time_series = TRUE,
  output = "tidy"
  #geometry = FALSE,
  #keep_geo_vars = FALSE,
  #shift_geo = FALSE,
  #key = NULL,
  #show_call = FALSE
)

Idaho_County_Components = get_estimates(
  geography = 'county',
  product = 'components',
  variables = NULL,
  breakdown = "characteristics",
  breakdown_labels = TRUE,
  year = 2019,
  state = 'ID',
  #county = NULL,
  time_series = TRUE,
  output = "tidy"
  #geometry = FALSE,
  #keep_geo_vars = FALSE,
  #shift_geo = FALSE,
  #key = NULL,
  #show_call = FALSE
)

# *** Heads up, this takes a while to run ***
Idaho_County_Characteristics = get_estimates(
  geography = 'county',
  product = 'characteristics',
  variables = NULL,
  breakdown = c('SEX',
                'AGEGROUP', 
                'RACE',
                'HISP'),
  breakdown_labels = TRUE,
  year = 2019,
  state = 'ID',
  #county = NULL,
  time_series = TRUE,
  output = "tidy"
  #geometry = FALSE,
  #keep_geo_vars = FALSE,
  #shift_geo = FALSE,
  #key = NULL,
  #show_call = FALSE
) 

Idaho_County_Housing = get_estimates(
  geography = 'county',
  product = 'housing',
  variables = NULL,
  breakdown = 'characteristics',
  breakdown_labels = TRUE,
  year = 2019,
  state = 'ID',
  #county = NULL,
  time_series = TRUE,
  output = "tidy"
  #geometry = FALSE,
  #keep_geo_vars = FALSE,
  #shift_geo = FALSE,
  #key = NULL,
  #show_call = FALSE
) 




