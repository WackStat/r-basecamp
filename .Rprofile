
# (oO,) .Rprofile from Marc Guillen (marc.guillen[at]wacko.ch)
cat("\014")
message("(oO,) .. LOADING Rprofile ...")

# Set some path
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_66')
Sys.setenv(SPARK_HOME='C:\\Tools\\Spark\\spark-1.5.2-bin-hadoop2.6')
.libPaths(c(file.path(Sys.getenv("SPARK_HOME"),"R","lib"),.libPaths()))

# Set the CRAN repos to ETHZ
local({r <- getOption("repos")
       r["CRAN"] <- "https://stat.ethz.ch/CRAN/"
       options(repos=r)
})

# Set some basics
options(papersize="a4")
options(help_type="html")

# Annoying R conventions
options(stringsAsFactors=FALSE)
options(show.signif.stars=FALSE)

# Fancy prompt
options(prompt="(RRRrr> ")
options(continue="...... ")

# overright q to quit promptly without saving
q <- function (save="no", ...) {
  quit(save=save, ...)
}

# Autoload quietly some package
auto.loads <-c("dplyr", "ggplot2")
quiet.library <- function(a.package){
  suppressWarnings(suppressPackageStartupMessages(
    library(a.package, character.only=TRUE)))
}
if(interactive()){
  invisible(sapply(auto.loads, quiet.library))
}

# Start and end of sessions
.First <- function() {
  # Autoload common libs
  invisible(sapply(auto.loads, quiet.library));
  message("(oO,) .. GO!")
}
.Last <- function() {
  message("\n(oO,) .. BYE!")
}

# Hidden env to survive a rm(list=ls())
# MAKE YOUR CODE NO MORE PORTABLE AS IS
.env <- new.env()
attach(.env)

.env$dummy <- function(x) {
  x
}

## THE END
message("(oO,) .. DONE!")
