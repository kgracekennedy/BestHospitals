#This function takes in a state (abbreviation) and an outcome (either "heart 
#attack", "heart failure", or pneumonia) in that order and returns the best hospital
#in that state.

#This is a simple ranking based only on 30 day survival after being admitted.

best <-function(state,outcome){
    ##Read outcome data
    data= read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ##Check that state and outcome are valid
    stdata=data[data$State==state,]
    if(nrow(stdata)==0){
        #Coursera wants a simpler error message. "invalid state"
        stop("Invalid State.  Did you include quotations and use the correct the abbreviation?")
    }
    
    ##Check that outcome is valid
    if(outcome=="heart attack") { 
        stdata=stdata[,c(2,11)]#Include 6 if you want the city
    } else if(outcome=="heart failure") {
        stdata=stdata[,c(2,17)]#Include 6 if you want the city
    } else if(outcome=="pneumonia") {
        stdata=stdata[,c(2,23)]#Include 6 if you want the city
    } else {
        stop("Invalid outcome.  Make sure you used quotation marks and entered a valid outcome.  The only supported outcomes are heart attack, heart failure, and pneumonia.")
    }
    
    #Make sure data is numeric and remove all NA's
    names=c("hospital","outcome")
    colnames(stdata)=names
    stdata[,2] <- as.numeric(stdata[,2])
    bad=is.na(stdata[,2])
    stdata=stdata[!bad,]#Clean and ready!
    stdata=stdata[order(stdata$hospital),]
    
    #ID minimum number of deaths within 30 days
    min=min(stdata[,2])#Update if you want city
    
    #Get hospital names with minimum number of deaths
    best=stdata[stdata[,2]==min,1]#Update if you want city

    return(best)
    
}


