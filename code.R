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

install.packages("dplyr")
library(dplyr)
controls <- filter(dat,Diet=="chow")
controls <- select(dat,Bodyweight)
class(controls)
controls
unlist(controls)
str(controls)
controls <- filter(dat,Diet=="chow") %>% select(Bodyweight) %>% unlist
controls

url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)
dat2 <- read.csv("msleep_ggplot2.csv")
View(dat2)
class(dat2)
primates <- filter(dat2,order=="Primates")
View(primates)
nrow(primates)
class(primates)
primates1 <- filter(dat2,order=="Primates") %>% 
  select(sleep_total)
View(primates1)
class(primates1)
primates2 <- filter(dat2,order=="Primates") %>% 
  select(sleep_total) %>% unlist %>% mean
p <- summarize(primates)
View(p)
?summarise
summarise(primates)
dat2 %>%  filter(order=="Primates") %>% summarise(sleep_total) %>% unlist %>% mean
