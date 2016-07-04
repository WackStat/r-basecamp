### R mandatory packages ###

# Several usefull utils
install.packages("Hmisc")

# Required to compile experimental package
install.packages("devtools")

## Project

# Use packrat to organise project
install.packages("packrat")

## Data

# Load foreign dat file
install.packages("foreign")

# Data manipulation done right
install.packages("dplyr")

# Data for Big
# SparkR package is loaded directly from the Spark distribution,
# just set the path in the lib in your .Rprofile

## Viz

# Use ggplot2 for quick R grap
install.packages("ggplot2")

# Use plotly/ggplotly for javacript vizualisation
# It uses htmlwidget to bind javascript libraries
install.packages("htmlwidgets")
install.packages("plotly")

## Communicate

# Use knitr+markdown to create reports
install.packages("rmarkdown")
install.packages("knitr")

#  Use Shiny to create interactive web packagesi
install.packages("shiny")
install.packages("shinydashboard")

## Extend

# Bind Java API - Install JDK before and set your JAVA_HOME ;)
Sys.setenv(JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home')
install.packages("rJava")

# Remote Access to R, for Tableau in particular
install.packages("Rserve")


### Go Go be creative
