setwd("C:/Users/tpanh/Documents/econed")

districts <- read.csv("districtdata.csv")

yrdata <- districts[which(districts$year >= 1990 & districts$year <=2015),]


#only michigan data in the sample

michdata <- yrdata[which(yrdata$statecode ==26),]

#tabulate years
yrsummary <- table(michdata$year)


#create reel dollar variables (as oppose to nominal variables)
michdata$totalspendingr <- michdata$totalspending/michdata$cpi
michdata$totalrevenuesr <- michdata$totalrevenues/michdata$cpi
michdata$totaltaxesr <- michdata$totaltaxes/michdata$cpi


#create per-pupil spending variables
#nominal

michdata$spending_pp <- michdata$totalspending/michdata$enrollment
michdata$revenues_pp <- michdata$totalrevenues/michdata$enrollment
michdata$taxes_pp <- michdata$totaltaxes/michdata$enrollment


#real
michdata$spending_ppr <- michdata$totalspendingr/michdata$enrollment
michdata$revenues_ppr <- michdata$totalrevenuesr/michdata$enrollment

michdata$taxes_ppr <- michdata$totaltaxesr/michdata$enrollment


#compare real versus nominal spending
install.packages("summarytools")
library(summarytools)


descr(michdata$spending_pp[michdata$year==1990])
descr(michdata$spending_ppr[michdata$year==1990])


descr(michdata$spending_pp[michdata$year==1990])
descr(michdata$spending_ppr[michdata$year==1990])



#i do my own on 2015
descr(michdata$spending_pp[michdata$year==2015])
descr(michdata$spending_ppr[michdata$year==2015])

#create a variable for budget surplus

michdata$balance <- michdata$totalrevenuesr - michdata$totalspendingr
sum(michdata$balance < 0 & michdata$year == 1993)

#describe spending and revenues before the policy

descr(michdata$spending_ppr[michdata$year ==1993])
descr(michdata$spending_ppr[michdata$year == 1998])

#i then do the same thing for revenues

descr(michdata$revenues_ppr[michdata$year ==1993])
descr(michdata$revenues_ppr[michdata$year ==1998])


#create a avariable that is the share of total revenues from property taxes
michdata$taxshare <- michdata$taxes_ppr/michdata$revenues_ppr

descr(michdata$taxshare[michdata$year == 1993])
descr(michdata$taxshare[michdata$year ==1998])

#create a subset of data with just the lowest funded schools

michq1 <- michdata[which(michdata$qq93 ==1),]

#i do the same for highest funded schools
michq4 <- michdata[which(michdata$qq93==4),]

descr(michq1$spending_ppr[michq1$year==1993])
descr(michq4$spending_ppr[michq4$year==1993])

descr(michq1$revenues_ppr[michq1$year==1993])
descr(michq4$revenues_ppr[michq4$year==1993])


#i then do the same for 1998,  spending as well as revenues
descr(michq1$revenues_ppr[michq1$year ==1998])
descr(michq4$revenues_ppr[michq4$year ==1998])

descr(michq1$spending_ppr[michq1$year==1998])
descr(michq4$spending_ppr[michq4$year==1998])

# i love r studido no i dont


gpg --full-generate-key

