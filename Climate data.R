setwd("H:/Documents/Projects/Latitude/data")



library(dplyr)
library(data.table)
library(ggplot2)
library(tidyverse)
library(gridExtra)


############################################ 
############ GET CLIMATE DATA ##############
############################################

library(raster)
library(sp)

climate <- getData("worldclim",var="bio",res=2.5)
point=read.csv("extractclimate.csv", sep=";")

values <- extract(climate,SpatialPoints(point[,2:1]))

df <- cbind.data.frame(coordinates(point),values)

write.csv(df,file="biovar.csv")
