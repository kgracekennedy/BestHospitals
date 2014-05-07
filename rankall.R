#This function takes in an outcome (either "heart attack", "heart failure", 
#or pneumonia) and a rank number (either a number or best or worst)
#in that order and returns the hospital with that rank from each state.

#By default the function will return the "Best" hospital.

#This is a simple ranking based only on 30 day survival after being admitted.

rankall <-function(outcome,num="best"){
    ##Read outcome data
    data= read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ##Check that outcome is valid
    if(outcome=="heart attack") { 
        data=data[,c(2,7,11)]
    } else if(outcome=="heart failure") {
        data=data[,c(2,7,17)]
    } else if(outcome=="pneumonia") {
        data=data[,c(2,7,23)]
    } else {
        stop("invalid outcome")
    }
    
    #Make sure data is numeric and remove all NA's
    names=c("hospital","state","outcome")
    colnames(data)=names
    data[,3] <- as.numeric(data[,3])
    bad=is.na(data[,3])
    data=data[!bad,]
    
    #For each state
    state=names(table(data$state))
    
    hospital=c()
    
    #We will go state by state and basically run a program like rank hospital.
    for(i in seq_along(state)){
        stdata=data[data$state==state[i],]
        orderedstdata=stdata[order(stdata$outcome,stdata$hospital),]#Data ordered!
        n=nrow(stdata)
        if(num=="best") {
            hospital[i]=orderedstdata[1,1]
        } else if(num=="worst") {
            hospital[i]=orderedstdata[n,1]
        } else if(num<=n){
            hospital[i]=orderedstdata[num,1]
        } else {
            hospital[i]=NA
        }            
    }
    v=cbind(hospital,state)
    v=as.data.frame(v)
    
    return(v)
}
