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

# Motivation
library(dplyr)
dat <- read.csv("femaleMiceWeights.csv")
controls <- filter(dat,Diet=="chow") %>% select("Bodyweight") %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select("Bodyweight") %>% unlist
mean(controls)
mean(treatment)
obs <- mean(treatment) - mean(controls)


library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
View(x)
y <- mean(x)
set.seed(1)
abs(mean(sample(x,5))-y)
set.seed(5)
abs(mean(sample(x,5))-y)


n <- 10000
nulls <- vector("numeric",n)
for (i in 1:n) {
  control <- sample(x,12)
  treatment <- sample(x,12)
  nulls[i] <- mean(treatment) - mean(control)
}
max(nulls)
hist(nulls)
mean( nulls > obs)

x
set.seed(1)
n <- 1000
vals <- vector("numeric",n)
for (i in 1:n) {
  vals[i] <- mean(sample(x,50))
}
vals
mean(abs(vals-mean(x))>1)

#Probability Distributions Exercises
install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)
View(gapminder)

#Create a vector x of the life expectancies of each country for the year 1952. 
# Plot a histogram of these life expectancies to see the spread of the different countries.
x <- filter(gapminder,year==1952) %>% select("lifeExp") %>% unlist
View(x)
hist(x)

#What is the proportion of countries in 1952 that have a life expectancy less than or equal to 40?
mean(x <=40)
#What is the proportion of countries in 1952 that have a life expectancy between 40 and 60 years?
mean(x <=60)-mean(x <=40)

prop = function(q) {
  mean(x <= q)
}
prop(40)
qs = seq(from=min(x), to=max(x), length=20)
props = sapply(qs, prop)
plot(qs, props)
props = sapply(qs, function(q) mean(x <= q))
plot(ecdf(x))
