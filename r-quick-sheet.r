## Keep in mind
# R is case sensitive
# R is in memory
# R is cool

## Getting help

help.start()   # general help

# Help on functions
apropos("foo") # list all functions containing string foo
help("foo")    # help about function foo
?foo           # same thing, help about function foo
example("foo") # show an example of function foo

# Search for foo in help manuals and archived mailing lists
RSiteSearch("foo")

# Get vignettes on using installed packages
vignette()      # show available vingettes
vignette("foo") # show specific vignette

## Workspace

# Current directory
getwd()         # print the current working directory
setwd("myPath")   # set the working directory to myPath string

# R path are backslash escaped or slash
pathBackslash = "c:\\myDirectory\\myFile.txt"
pathBetterSlash = "c:/myDirectory/myFile.txt"

# View and set options for the session
options()           # view current option settings
options(digits=3)   # number of digits to print on output
getOption("option") # Retrieve the value of an option
# You can intialize options at session startup in Rprofile.site file,
# by default located in in R-n.n.n\etc 

# Work with workspace objects, default is ".RData" in cwd
ls()                       # list the objects in the current workspace
objectA                    # prints the object
str("objectA")             # describe the structure of an object 
class("objectA")           # class or type of an object
exists("objectA")          # check if an object exists in the workspace
rm("objectA","objectB")    # remove the object from the workspace
rm(list=ls())              # wipe the entire workspace
save.image("myFile.Rdata") # save the entire workspace to the file
save(objectList,
     file="myFile.Rdata")  # save specific objects to the file
load("myFile.Rdata")       # load a workspace into the current session

# Work with command history, default is ".Rhistory" in cwd
history()                  # display last 25 command
history(max.show=Inf)      # display all previous commands
savehistory(file="myFile") # save your command history 
loadhistory(file="myFile") # recall your command history

# Session Input/Output
source("myScript.r")                         # sourcing a script file
sink("myLog.txt", append=FALSE, split=TRUE)  # redirecting text output to file
sink()                                       # reseting text output to standard
pdf("myGraph.pdf")                           # deviate graph output to a pdf  
png("myGraph.png")                           # deviate graph to a png image
# other graph deviations: win.metafile, png, jpeg, bmp, postscript
dev.off()                                    # reseting graph output to standard

# Package and libraries
installed.packages()                  # list all installed packaged
install.packages("aPackage")          # intall a new package with dependencies
update.packages("aPackage")           # update a package
update.packages()                     # update all packages installed
remove.packages("aPackage")           # remove a single package
.libPaths()                           # get library location 
library()                             # see all libraries installed 
library("myPacakge1","myPackage2")    # load specific libraries for use
search()                              # see libraries currently loaded

# Ending the journey
q() # quit R. You might be prompted to save the workspace.


### Data types
NA
NULL
NaN


### Basic data structures

fix(x)                        # quickly edit the object in place
length(object)                # number of elements or components

## vectors, collection same type
a <- c(-1,0,1,2)
b <- c("a","b","c")
C <- c(TRUE, FALSE, TRUE)
d <- c(1:10)
r <- rep(c(1,2,3),10)
s <- sample(0:1, 20, replace = TRUE)
seq()
runif()
rnorm()

a[2]
d[-2]
b[c(1,3)]
b[c(2,1,3)] # changing oder

is.vector(a)
as.vector("str")

c(1,c(2,3,4),5:10)

## matrix, 2 dimension collection of the same type
x <- matrix(1:20, nrow=5,ncol=4)

yCells <- c(1,6,19,80)
yRNames <- c("R1","R2")
yCNames <- c("C1","C2")
yNames <- list(yRNames, yCNames)
y <- matrix(yCells,nrow=2,ncol=2,byrow = TRUE, dimnames = yNames)

x[4,1]
X[1,]
X[,3]
x[,-4]
x[c(1,2),2:4]
y["C1",]

is.matrix(y)
as.matrix(a)
dim(y)
dimnames(y)
nrow(x)
ncol(x)

## array, n-dimension collection of the same type
iCells <- c(1:36)
iDim <- c(3,3,4)
iANames <- c("A1","A2","A3")
iBNames <- c("B1","B2","B3")
iCNames <- c("C1","C2","C3","C4")
iNames <- list(iANames, iBNames, iCNames)
i <- array(iCells,iDim, dimnames = iNames)

cbind(1,2,3)
rbind(c(1:10))

i[,,1]
i["A1",c(1,3),]
i[,-2,]

is.array(i)
as.array(y)
dim(i)
dimnames(i)
nrow(i)
ncol(i)


## Factor, enumerate types
f1 <- factor(c(rep("y",10),rep("n",20)))

f2 <- factor(c(rep("y",10),rep("n",20),"maybe"), 
              levels = c("y","n"),
              labels = c("yes","no"))

f3 <- factor(c(rep("y",10),rep("n",20),"maybe"), 
              ordered = TRUE)

f1[[1]]
f2[1]

levels(f1)
labels(f3)

is.factor(f1)
is.ordered(f3)
as.factor(b)
as.ordered(f3)


## Data Frame

## List

nrow(f1)
ncol(f1)


## Tips

# timing 
proc.time()                   # return a time pointer
system.time(myExpression)     # time a simple expression, it calls proc.time 
                              # before and after the expresion and make a diff