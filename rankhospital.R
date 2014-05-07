#This function takes in a state (abbreviation), an outcome (either "heart 
#attack", "heart failure", or pneumonia), and a rank number (either a number or best or worst)
#in that order and returns the hospital with that rank in that state.

#By default the function will return the "Best" hospital.

#This is a simple ranking based only on 30 day survival after being admitted.

rankhospital <-function(state,outcome,num="best"){
    ##Read outcome data
    data= read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ##Check that state and outcome are valid
    stdata=data[data$State==state,]
    if(nrow(stdata)==0){
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
    #NB: This does secondary sorts.
    orderedstdata=stdata[order(stdata$outcome,stdata$hospital),]#Data ordered!
    n=nrow(stdata)
    
    if(num=="best"){
        besty=orderedstdata[1,1]
    } else if(num=="worst") {
        besty=orderedstdata[n,1]
    } else if(num<=n){
        besty=orderedstdata[num,1]
    } else {
        besty=NA
    }   
return(besty)
}