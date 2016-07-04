
# Load the SparkR library
# The SPRAK_HOME/R/lib should be in your .libPaths
quiet.library("SparkR")

# initalize a new Spark Context, i.e., connect R to Spark;
# runs on localhost by default;
# load the spark-csv package
sc <- sparkR.init(master = "local"
                 ,appName = "SparkR_Interactive"
                 ,sparkPackages="com.databricks:spark-csv_2.10:1.3.0"
#                 ,sparkJars="spark-csv-assembly-1.1.0.jar"
)

# initalize a new SQLContext so we can work with DataFrames
sqlContext <- sparkRSQL.init(sc)

# or initalize a new HiveContext; inherits from SQLContext and adds support
# for finding tables in the MetaStore and writing queries using HiveQL
# hiveContext <- sparkRHive.init(sc)

message(":: Spark started ::")

################# EXAMPLE 1 #################

# create a sparkR DataFrame from an existing R ds
sampleDF <- createDataFrame(sqlContext, faithful)
head(sampleDF)
printSchema(sampleDF)

################# EXAMPLE 2 #################

# Create a simple local data.frame;
# Convert local data frame to a SparkR DataFrame
localDF <- data.frame(name=c("John", "Smith", "Sarah"), 
                      age=c(19, 23, 18))
pushedDF <- createDataFrame(sqlContext, localDF)
head(pushedDF)
printSchema(pushedDF)

################# EXAMPLE 3 #################

# Create a DataFrame from a JSON file
jasonPath <- file.path(Sys.getenv("SPARK_HOME"), "examples/src/main/resources/people.json")
jasonDF <- jsonFile(sqlContext, jasonPath)
head(jasonDF)
printSchema(jasonDF)

# Register this DataFrame as a table.
registerTempTable(jasonDF, "people")

# SQL statements can be run by using the sql methods provided by sqlContext
teenagers <- sql(sqlContext, "SELECT name FROM people WHERE age >= 13 AND age <= 19")

# Call collect to get a local data.frame
teenagersLocalDF <- collect(teenagers)

# Drop the temporary table
dropTempTable(sqlContext, "people")

# Print the teenagers in our dataset 
print(teenagersLocalDF)


################# EXAMPLE 4 #################

# Load the flights CSV file using `read.df`. Note that we use the CSV reader 
# Spark package here.
flights <- read.df(sqlContext
                   ,path = "D:/Dev/ds-fun-datasets/nycflights2013.csv"
                   ,"com.databricks.spark.csv"
                   ,header = "true")
head(flights)
count(flights)

# Run a query to print the top 5 most frequent destinations from JFK

# Filter by airport
jfkFlights <- filter(flights, flights$origin == "JFK")

# Group the flights by destination and aggregate by the number of flights
destFlights <- agg(group_by(jfkFlights, jfkFlights$dest), 
                   count = n(jfkFlights$dest))

# Now sort by the `count` column and print the first few rows
head(arrange(destFlights, desc(destFlights$count)), n = 5)

# The above analysis written with pipes
destFlights <- 
  filter(flights, flights$origin == "JFK") %>% 
  group_by(flights$dest) %>% 
  summarize(count = n(flights$dest));

arrange(destFlights, desc(destFlights$count)) %>% 
  head(n = 5);

# Save them in a local data.frame
destflightsLocalDF <- collect(destFlights)


################# EXAMPLE 5 #################



############### END EXAMPLE ############### 

# stop the Spark Context
sparkR.stop()

message(":: Spark stopped ::")
