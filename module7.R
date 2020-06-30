### Module 7
## 7.1

getwd()

library(rio)
ps2020 <- import("fatal-police-shootings-data.csv")


#understand the data a bit better
head(ps2020)
summary(ps2020)


# look at some individual variable
table(ps2020$gender)
table(ps2020$race)

## 7.2 The Logic of Loops/Conditionals
# manually repeat a task just to illustrate
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)
sample(0:100, 1)

# loop that will give you 20 random numbers with 5(not 20) lines

for ( i in 1:20) 
  {
  x <- sample(0:100, 1)
  print(x)
  i=i+1
}

# while loop: use an example and discuss the components:

testwhile <- 1 #Create the loop
while (testwhile <= 5){
  cat('We are on loop number',testwhile)
  #very important, must have a way to get out of the while loop at some point
  testwhile <- testwhile+1
  print(testwhile)
}
  

# application of while loop to stock prices and values
set.seed(456)
# Set stock value and price
stock <- 100
price <- 100
# A counter for the number of loops
numloops <- 1
# Initialize the while statement
while (price > 90){
  # Generate random numbers between 80 and 120
  price <- stock + sample(-20:20, 1)
  # Count the number of loop
  numloops = numloops +1
  # Print the number of loop
  print(numloops)
}
cat('it took',numloops,'loop before we short the price. The lowest price is',price)

# for loop background and application
#For (i in vector) {
# Exp
#}


# Create an organization vector
orgs <- c('World Bank', 'the African Development Bank', 'the Bill and Melinda Gates Foundation')

#create the for statement
for (i in orgs){
  print (i)
}

#intro a matrix
#create a matrix
M <- matrix (c(1:12), nrow = 4, byrow =TRUE)
print(M)


# Create a matrix
mat <- matrix(data = seq(1, 10, by=1), nrow = 5, ncol =2)
print(mat)

# Create the loop with r and c to iterate over the matrix
for (r in 1:nrow(mat))
  for (c in 1:ncol(mat))
    print(paste("Row", r, "and column",c, "have values of", mat[r,c]))
 q

# if and else conditional and their variants

DenlyAsleep <- c(1,1,1,1,1,1,1,0)
ifelse(test = DenlyAsleep ==1, yes = "always!", no = "wow, He's Awake!")

inequality <- c(ifelse(inequality_gini<mean(inequality_gini), yes = 1, no = 0)
ifelse(inequality = inequality_gini < mean(inequality_gini), yes = "high_inequality", no = "low_inequality")

#if (condition) {
# Expr1
#} else {
# Expr2
#}

# Create vector quantity  
quantity <- 899
# Set the is-else statement
if (quantity > 900) {
  print('You scored well!')
} else {
  print('Try harder next time!')
}

#else-if
#if (condition){
#  expr1
#} else if (condition2) {
  #  expr2
  #}
# else if (condition3) {
   #  expr3
   #}
# else {
   #   expr4
   # }


# Create vector quantiy
quantity <- 999
# Create multiple condition statement
if (quantity < 800) {
  print('Time to turn off Netflix!')
} else if (quantity >= 800 & quantity <= 900) {
  print('It is coming along! Keep working at it!')
} else {
  print('You nailed it!!')
}


library(dplyr)

#let's first reduce the variables
ps2020sub <- subset(ps2020,
                    select = c("age", "raceblack", "armedgun"))
#let's now reduce the rows to make this more tractable to view
ps2020subfilter <- filter(ps2020sub, age == 70 )

for (r in 1:nrow(ps2020subfilter))
  for (c in 1:ncol(ps2020subfilter))
    print(paste("Row", r, "and column", c,
                "have values of", ps2020subfilter[r,c]))

for (r in 1:nrow(ps2020subfilter))
  if (ps2020subfilter[r,3] == 1) {
    print('Victim was armed')
  } else {
    print('Victim was not armed')
  }




ps2020$threatattack = NA
ps2020$threatattack[ps2020$threat_level == "attack"] = 1
ps2020$threatattack[ps2020$threat_level != "attack"] = 0
ps2020$raceblack = NA
ps2020$raceblack[ps2020$race == "B"] = 1
ps2020$raceblack[ps2020$race != "B"] = 0
ps2020$armedgun = NA
ps2020$armedgun[ps2020$armed == "gun"] = 1
ps2020$armedgun[ps2020$armed != "gun"] = 0



library(dplyr)
ps2020small <- filter(ps2020, age == 15 )
ps2020small2 <- subset(ps2020small,
                       select = c("age", "race", "armed"))





for (r in 1:nrow(ps2020small2)){
  for (c in 1:ncol(ps2020small2)) {
    if (ps2020small2[r,c] == "W") {
      ps2020small2[r,c] = "White"
    }
    else if (ps2020small2[r,c] == "B") {
      ps2020small2[r,c] = "Black"
    }
    else {
    }
  }
}

### Module 7.3 
## Writing and Using Functions in R

install.packages("cars")
library(foreign)
x <- cars
min(x$speed)
max(x$speed)
min(x$dist)
max(x$dist)
mean(x$speed)
mean(x$dist)

#function.name <- funcition(arguments)
#{
 # computations on the arguments
  #some other code
#}


# compute the square of integer `n`
# calling the function and passing value 4

xyzabcsometing <- function(n)
{
  n^2
}
xyzabcsometing(12)

squared <- 12*12
squared


# compute the mean of a vector `n`
# calling the function and passing value 4
mean_function <- function(x)
{

  sum(x) / length(x)
}

mean_function(ps2020subfilter$armedgun)



### Module 7.4 
## Some Functions to Simplify Loops: apply, lapply, sapply


matrix1 <- matrix(C<-(1:10),nrow=5, ncol=6)
matrix1


matrix1_a <- apply(matrix1, 2, sum)
matrix1_a

for (c in 1:ncol(matrix1))
  print(paste("Column",c, "has values of", sum(matrix1[,c])))

## Now Let’s Turn to "lapply"
# Here is the general syntax:
  # lapply(X, FUN)
  # Arguments:
  # X: A vector or an object
  # FUN: Function applied to each element of x

countries <- c("AFGHANISTAN","BAHRAIN","LESOTHO","ZIMBABWE")
countries_lower <-lapply(countries, tolower)
str(countries)

str(countries_lower)

countries_lower <-unlist(lapply(countries,tolower))
str(countries_lower)



### And Now sapply
# Here is the general syntax:
# sapply(X, FUN)
# Arguments:
#  – X: A vector or an object
# – FUN: Function applied to each element of x

dt <- cars
lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min)
lmn_cars

smn_cars

lmxcars <- lapply(dt, max)
smxcars <- sapply(dt, max)
lmxcars

avg <- function(x) {
  ( min(x) + max(x) ) / 2}
fcars <- sapply(dt, avg)
fcars

## Let’s apply this to the police data
## Let’s compute the average, min, and max ages of people who were the victims of police shootings

ps2020age <- subset(ps2020,
                    select = "age")
ps2020age_mean <- apply(ps2020age, 2, mean)
ps2020age_mean


ps2020age_mean <- apply(na.omit(ps2020age), 2, mean)
ps2020age_mean

ps2020age_min <- apply(na.omit(ps2020age), 2, min),
ps2020age_min


ps2020age_max <- apply(na.omit(ps2020age), 2, max)
ps2020age_max

mean(ps2020age$age, na.rm=TRUE)



### Module 7.5 
## Pattern Matching and Replacement

x <- c("INXS", "WHAM!", "KISS", "ABBA", "RUSH", "MGMT", "AC/DC", "BB King")
grep("S", x)
grep("BB", x)
grepl("BB", x)
grep("S|BB", x)

x <- c("INXS", "WHAM!", "KISS", "ABBA", "RUSH", "MGMT", "AC/DC", "BB King")
sub("SS", "PP", x)
gsub("BB", "The", x)


ps2020pattern <- ps2020 
View(ps2020pattern)

grep("San", ps2020pattern$city)
y <- gsub("San", "The", ps2020pattern$city)



ps2020pattern$race <- gsub("W", "White", ps2020pattern$race)
ps2020pattern$race <- gsub("B", "Black", ps2020pattern$race) 
ps2020pattern$race <- gsub("H", "Hispanic", ps2020pattern$race)


### Module 7.6 
## Working with Dates and Times


install.packages("lubridate")
library(tidyverse)
library(lubridate)

install.packages("nycflights13")
library(nycflights13)



today()

now()

ymd("2017-10-31")


mdy("January 31st, 2017")


dmy("31-Jan-2017")


# Creating dates from individual date-time components
flights %>%
  select(year, month, day, hour, minute)


# We can create a new variable that year, month, day, hour, minute all together
flights %>%
  select(year, month, day, hour, minute) %>%
  mutate(departure = make_datetime(year, month, day, hour, minute))


# Let’s apply this to the police data
ps2020dates <- ps2020 
head(ps2020dates)

ymd("2015-01-02")

# Let’s try splitting this into three different variables:

ps2020dates <- 
  ps2020dates %>%
  dplyr::mutate(year = lubridate::year(ps2020dates$date), 
                month = lubridate::month(ps2020dates$date),
                day = lubridate::day(ps2020dates$date))

# Now let’s try putting them back together again:
ps2020dates$yearmonthday <- ymd(paste(ps2020dates$year,
                                      ps2020dates$month, ps2020dates$day))

library(tidyverse) 
library(ggplot2) 
library(lubridate)
# create a separate df 
ps2020overview <- ps2020
#let's create a timestamp variable with declared (ymd) format
ps2020overview$timestamp <- ymd(ps2020overview$date)
#Here are a couple of visualizations
ggplot(ps2020overview, aes(x = timestamp)) +
  geom_histogram(position = "identity", bins = 20, show.legend = FALSE) + 
  coord_cartesian(ylim = c(250,350))

ggplot(ps2020overview, aes(x = timestamp)) + 
  geom_bar(position = "identity", show.legend = FALSE)

#First recode the gender variable
ps2020gender <- ps2020overview 
table(ps2020gender$gender)


for (r in 1:nrow(ps2020gender)){
  if (ps2020gender$gender[r] == "M") {
    ps2020gender$gender[r] = "Male" }
  else if (ps2020gender$gender[r] == "F") {
    ps2020gender$gender[r] = "Female" }
  else if (ps2020gender$gender[r] == "") { 
    ps2020gender$gender[r] = "Other/Unknown"
  } else {
  } 
  }
ggplot(ps2020gender, aes(x = gender)) + 
  geom_bar(position = "identity", show.legend = FALSE)

#First recode the race variable
ps2020race1 <- ps2020 
table(ps2020race1$race)

ps2020race1$race <- gsub("A", "Asian", ps2020race1$race) 
ps2020race1$race <- gsub("B", "Black", ps2020race1$race) 
ps2020race1$race <- gsub("H", "Hispanic", ps2020race1$race) 
ps2020race1$race <- gsub("N", "Native American", ps2020race1$race) 
ps2020race1$race <- gsub("O", "Other", ps2020race1$race) 
ps2020race1$race <- gsub("W", "White", ps2020race1$race)


#gsub doesn't work so well with our blank value. change that to unkown diff 
#feel free to try and see what happens. fortunately, we can recode easily i 
ps2020race1$race[ps2020race1$race == ""] = "Unknown"
#ps2020race1$race <- gsub("", "Unknown", ps2020race1$race)
ggplot(ps2020race1, aes(x = race)) +
  geom_bar(position = "identity", show.legend = FALSE)

ggplot(ps2020race1, aes(x = race)) +
  geom_bar(position = "identity", show.legend = FALSE)

ps2020age1 <- ps2020
# let's try a violin plot
ggplot(ps2020age1, aes(ps2020race1$race, age)) + 
  geom_violin()


#let's experiment with the violin plot to convey more info. add points, jitter, and mor
ggplot(ps2020age1, aes(ps2020race1$race, age)) +
  geom_violin() +
  geom_jitter(shape=16, position=position_jitter(0.2), alpha=0.3)

#not so bad. we can try some other possibilities. go with an embedded boxplot?
ggplot(ps2020age1, aes(ps2020race1$race, age)) + 
  geom_violin() +
  geom_boxplot(width=0.1)



# or try putting in different stats and coloring them.
# fancier. maybe too fancy. and we really need to experiment with color schemes!! 
fancier <- ggplot(ps2020age1, aes(x=ps2020race1$race, y=age, fill=ps2020race1$race)) +
geom_violin(trim=FALSE) +
  geom_boxplot(width=0.1, fill="white") + labs(title="Plot of length by race",x="Race", y = "Age") 
fancier + theme_classic()


# one more: we could do this by gender too. Keeping the overall scatters by race but sh 
# notice
ggplot(ps2020age1, aes(x=ps2020race1$race,
                       y=age, 
                       shape=gender, 
                       colour=gender)) +
  geom_violin() + 
  geom_jitter(shape=16,
              position=position_jitter(0.2), 
              alpha=0.3)





# How many died by being shot over time?
ps2020addtl <- ps2020
ps2020addtl <- 
  ps2020addtl %>%
  dplyr::mutate(year = lubridate::year(ps2020addtl$date), 
                month = lubridate::month(ps2020addtl$date),
                day = lubridate::day(ps2020addtl$date),
                counter = ps2020addtl$manner_of_death == "shot", 
                yearmonth = paste(year,month,sep="")) %>%
  dplyr::select(year,month,day,yearmonth,age,counter) 

by_month_shot <- group_by(ps2020addtl, year, month)
monthly_shot <- summarize(by_month_shot, occurrence=sum(counter, na.rm=TRUE))


#monthly$yearmonth <- NA
monthly_shot$yearmonth <- paste(monthly_shot$year,monthly_shot$month, sep="") 

#monthly_shot$yearmonth <- as.numeric(monthly_shot$yearmonth)
ggplot(monthly_shot, aes(x = yearmonth,
                         y = occurrence)) + geom_point() +
  coord_cartesian(ylim = c(50,125)) + theme(axis.text.x = element_text(size=6, angle=45),
                                            axis.text.y = element_text(size=6, angle=45))
