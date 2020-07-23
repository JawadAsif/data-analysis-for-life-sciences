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


load("skew.RData")
dim(dat)
View(dat)
class(dat)
par(mfrow = c(3,3))
for (i in 1:9) {
  qqnorm(dat[,i])
}

?hist
seq(floor(dat[,4]),ceiling(dat[,4]),0.1)
floor(dat[,4])
hist(dat[,4],breaks = 
       seq(floor(min(dat[,4])),
           ceiling(max(dat[,4]))))

?par
par(mfrow=c(1,1))

hist(dat[,9],breaks = 
       seq(floor(min(dat[,9])),
           ceiling(max(dat[,9]))))

# box-plot
head(InsectSprays)
View(InsectSprays)
?boxplot
boxplot(InsectSprays)
?split
boxplot(split(InsectSprays$count,10))
boxplot(InsectSprays$count,InsectSprays$spray)
x <- split(InsectSprays,InsectSprays$spray)
x
par(mfrow=c(3,2))
boxplot(x)
?boxplot
boxplot(split(InsectSprays,InsectSprays$spray))
y <- split(InsectSprays$count,InsectSprays$spray)
boxplot(y)
par(mfrow=c(1,1))

library(dplyr)
install.packages("UsingR")
data(nym.2002, package="UsingR")
View(nym.2002)
hist(nym.2002$time)
?hist
x <- split(nym.2002$time,nym.2002$gender)
x
hist(x$Male)
hist(x$Female)
boxplot(x)
qqnorm(x$Male)
qqline(x$Male)
qqnorm(x$Female)
qqline(x$Female)
mean(x$Male)
mean(x$Female)
sd(x$Male)
sd(x$Female)

