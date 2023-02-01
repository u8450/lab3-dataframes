### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3
# install.packages("tidyverse")
library(tidyverse)
## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out
seahawks_score <- c(20, 30, 40, 50, 60)

## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name
seahawks_scored_against <- c(0, 8, 20, 40, 50)

## Combine your two vectors into a dataframe
game <- data.frame(seahawks_score, seahawks_scored_against)

## Create a new column "diff" that is the difference in points
## (in favor of Hawks)

game$diff <- game$seahawks_score - game$seahawks_scored_against

## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them

game$won <- game$seahawks_score > game$seahawks_scored_against




## Create a vector of the opponents name (such as "Denver Broncos")

teams <- c("team1", "team2", "team3", "team4", "team5")

## Add the vector of opponents into the data frame
game$teams <- teams
## Compute the average score of Seahawks
avg <- mean(game$seahawks_score)

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)
wins <- length(game$won)


## What was the largest difference in scores (in favor of Seahawks)?
max <- max(game$diff)
max <- max(game[['diff']])

is.data.frame(game['diff'])
is.vector(game[['diff']])
## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`
diff_op <- length(unique(game$teams))

## Print the variable names in your data frame
print(colnames(game))

colnames(game)[1]
## Write a loop over all variables in your data frame
## print the variable name inside the loop
for (i in 1:ncol(game)){
  cat('the variable name at', i, 'column is', colnames(game)[i], '\n')
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'

for (i in 1:ncol(game)){
  cat('the variable name at', i, 'column is', colnames(game)[i], '\n')
  if (is.numeric(game[[i]])){
    print("True!")
  } else {
    print("False")
  }
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric
for (i in 1:ncol(game)){
  cat('the variable name at', i, 'column is', colnames(game)[i], '\n')
  if (is.numeric(game[[i]])){
    avg <- mean(game[[i]])
    print(avg)
  } else {
    print("False")
  }
}


##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`
name <- c("Employee ")
nums <- c(1:100)

employees <- paste(name, nums)

## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120
salaries2021 <- runif(100, 30, 120)

## Create a random vector of 2022 salaries that are typically
## higher than the 2014 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.
salaries2022 <- runif(100, 40, 130)

## Create a data.frame 'salaries' by combining the vectors you just made
salaries_df <- data.frame(employees, salaries2021, salaries2022)

## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022

salaries_df$raise <- salaries2022 > salaries2021

## Retrieve values from your data frame to answer the following questions:
##
## What was the 2015 salary of employee 57
employee_5 <- salaries_df[salaries_df$employees == "Employee  5", "salaries2021"]

## Now round the answer down to two digits after comma
## check out 'round()' function

employee_5_round <- round(employee_5, 1)

## How many employees got a raise?
raise_count <- length(salaries[salaries_df$raise == TRUE])

## What was the value of the highest raise?
## Round the number to two digits!
salaries_df$amount_raised <- salaries_df$salaries2022 - salaries_df$salaries2021
max_raise <- round(max(salaries_df$amount_raised), 2)

## What was the name of the employee who recieved the highest raise?
salaries_df[salaries_df$amount_raised == max(salaries_df$amount_raised), "employees"]

## What was the average salary increase?
## Round the number!
avg_increase <- mean(salaries_df$amount_raised)

## For people who did not get a raise, how much money did they lose?
## Round the number!
salary_decrease <- salaries_df[salaries_df$raise == FALSE, "amount_raised"]
