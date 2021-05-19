# Referencing Census R Script
# also has loaded Tidyverse and Tidycensus

source("../scripts/Tidycensus_Idaho_County.R") # This took about five minutes to run
# readRenviron("~/.Renviron") # I don't think I actually need this

# Additional Libraries
library(sf)
library(leaflet)
library(mapview)

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