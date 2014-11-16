#Just a quick peek at the heart attack data (30 day death rate)
#suggested in part 1 of the instructions

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
HeartAttackData=outcome[,11]
hist(HeartAttackData,
     main="30 Day Death Rate",
     xlab="Mortality (As Percentage)"
     )
