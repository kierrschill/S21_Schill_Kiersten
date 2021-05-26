source("../scripts/Tidycensus_Idaho_County.R") # This took about five minutes to run
# Referencing Census R Script
# also has loaded Tidyverse and Tidycensus
# This took about five minutes to run

# Notes:
# idaho falls, rexburg, meridian,
# count of age group (saving accounts for missionaries), for distribution purpose
# don't care about race
# start with 2019 (might pull other dates later)
# for some tables pivot wider

# Starting with Idaho_County_Characteristics

County_Characteristics <- Idaho_County_Characteristics %>% 
  filter(NAME %in% c('Ada County, Idaho', 'Bonneville County, Idaho', 'Madison County, Idaho'),
         value > 0) %>%
  select(-c('GEOID', 'RACE', 'HISP')) %>% 
  group_by(NAME, SEX, AGEGROUP, DATE) %>% 
  summarize(count = sum(value))
  
County_Components <- Idaho_County_Components %>% 
  filter(NAME %in% c('Ada County, Idaho', 'Bonneville County, Idaho', 'Madison County, Idaho'),
         value > 0) %>% 
  select(-('GEOID')) %>%
  group_by(NAME, PERIOD, variable) %>% 
  summarize(count = sum(value))

County_Housing <- Idaho_County_Housing %>% 
  filter(NAME %in% c('Ada County, Idaho', 'Bonneville County, Idaho', 'Madison County, Idaho'),
         value > 0) %>% 
  select(-('GEOID')) %>%
  group_by(NAME, DATE, variable) %>% 
  summarize(count = sum(value))

County_Population <-  Idaho_County_Population %>% 
  filter(NAME %in% c('Ada County, Idaho', 'Bonneville County, Idaho', 'Madison County, Idaho'),
         value > 0) %>% 
  select(-('GEOID')) %>%
  group_by(NAME, DATE, variable) %>% 
  summarize(count = sum(value))  

