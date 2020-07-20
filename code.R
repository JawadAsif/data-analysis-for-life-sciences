install.packages("downloader")
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
download(url, destfile=filename)
dat <- read.csv("femaleMiceWeights.csv")
dat
dat[12,2]
dat$Bodyweight
dat[["Bodyweight"]]
dat$Bodyweight[11]
View(dat)
mean(dat$Bodyweight[13:24])
?sample
set.seed(1)
sample(13:24,1)
dat$Bodyweight[21]
