# Referencing Census R Script
# also has loaded Tidyverse and Tidycensus

source("../scripts/Tidycensus_Wrangling.R") # This took about five minutes to run
# readRenviron("~/.Renviron") # I don't think I actually need this

# Additional Libraries
library(sf)
library(leaflet)
library(mapview)
library(tidyverse)

# Plots

# Choropleth Map
# Source: https://map-rfun.library.duke.edu/02_choropleth.html
# nc_pop <- 
#   get_acs(geography = "county",
#           variables = "B01003_001",
#           state = "NC",
#           geometry = TRUE)
# mapview(nc_pop, zcol = "estimate")

mapview((get_acs(geography = "county",
                variables = "B01003_001",
                state = "ID",
                geometry = TRUE)),
        zcol = "estimate")  # This is all of Idaho's population by County

# Boxplots
# ggplot(airquality, aes(y = Temp)+
#          geom_boxplot)

# COUNTY PLOT

County_Characteristics %>% 
  filter(AGEGROUP == 'All ages') %>% 
  group_by(NAME,SEX) %>% 
  summarise(average = mean(count),
            median = median(count),
            # minimum = minimum(count),
            # maximum = maximum(count)
            )%>% 
              ggplot() +
              geom_col(
                aes(x = as.factor(NAME),
                    y = average/100,
                    fill = SEX,
                    group = SEX),
                position = position_dodge2()
              )+
              theme_minimal()


County_Components %>% 
  group_by(NAME, variable) %>% 
  summarise(average = mean(count),
            median = median(count)) %>% 
  ggplot()+
  geom_col(
    aes(x = variable,
        y = average,
        fill = NAME,
        group = NAME),
    position = position_dodge2()
  )+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

County_Housing %>% 
  group_by(NAME, variable) %>% 
  summarise(average = mean(count),
            median = median(count)) %>% 
  ggplot()+
  geom_col(
    aes(x = variable,
        y = average,
        fill = NAME,
        group = NAME),
    position = position_dodge2()
  )+
  theme_minimal()
              
County_Population %>% 
  filter(variable == 'POP') %>% 
  group_by(NAME, variable) %>% 
  summarise(average = mean(count),
            median = median(count)) %>% 
  ggplot()+
  geom_col(
    aes(x = variable,
        y = average/10,
        fill = NAME,
        group = NAME),
    position = position_dodge2()
  )+
  theme_minimal()
