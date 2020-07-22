library(gtools)
 suits <- c("Diamonds","Clubs","Hearts","Spades")
 numbers <- c("Ace","Deuce","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King")
 deck<- expand.grid(number=numbers,suit=suits)
 deck <- paste(deck$number,deck$suit)

kings <- paste("King", suits)
 aces <- paste("Ace",suits)
 facecard<- c("King","Queen","Jack","Ten")
 facecard <- expand.grid(number=facecard,suit=suits)
 facecard <- paste(facecard$number,facecard$suit)

 hand <-sample(deck,2)
 results <- replicate(10000,{
      hand<- sample(deck,2)
     (hand[1]%in%aces & hand[2]%in%facecard) |
       (hand[2]%in%aces & hand[1]%in%facecard)})
 mean(results)