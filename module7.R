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
orgs <- c('united Nations','World Bank', 'USAID', 'DFID/UKAID')

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


# if and else conditional and their variants

DenlyAsleep <- c(1,1,1,1,1,1,1,0)
ifelse(test = DenlyAsleep ==1, yes = "always!", no = "wow, He's Awake!")






























