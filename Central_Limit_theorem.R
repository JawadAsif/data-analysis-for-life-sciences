library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
x
# make averages5
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}

hist(averages5)
hist(averages50)
qqplot(averages5,averages50)
qqline(averages5,averages50)
min(averages5)
min(averages50)
max(averages5)
max(averages50)

#For the last set of averages, the ones obtained from a sample size of 50, what proportion are between 23 and 25?
mean(averages50 < 25) - mean(averages50 < 23)

#What is the proportion of observations between 23 and 25 in a normal distribution with average 23.9 and standard deviation 0.43?
mu <- 23.9
sd <- 0.43
pnorm(25,mu,sd)-pnorm(23,mu,sd)

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 
View(dat)
summary(dat)
str(dat)
dat <- na.omit(dat)
str(dat)

#Use dplyr to create a vector x with the body weight of all males on the control (chow) diet.
library(dplyr)
x <- filter(dat,Sex=="M" & Diet == "chow") %>% select("Bodyweight") %>% unlist
mean(x)

library(rafalib)
popsd(x)

set.seed(1)
X <- sample(x,25)
mean(X)

y <- filter(dat,Sex=="M" & Diet == "hf") %>% select("Bodyweight") %>% unlist
mean(y)
popsd(y)

set.seed(1)
Y <- sample(y,25)
mean(Y)

abs((mean(y)-mean(x))-(mean(Y)-mean(X)))

#females

x <- filter(dat,Sex=="F" & Diet == "chow") %>% select("Bodyweight") %>% unlist
mean(x)

library(rafalib)
popsd(x)

set.seed(2)
X <- sample(x,25)
mean(X)

y <- filter(dat,Sex=="F" & Diet == "hf") %>% select("Bodyweight") %>% unlist
mean(y)
popsd(y)

set.seed(2)
Y <- sample(y,25)
mean(Y)

abs((mean(y)-mean(x))-(mean(Y)-mean(X)))

##
dat
str(dat)
?pnorm
pnorm(-1) + (1 - pnorm(1))
pnorm(1)-pnorm(-1)
pnorm(2)-pnorm(-2)
pnorm(3)-pnorm(-3)

#Define y to be the weights of males on the control diet.
y <- filter(dat,Diet=="chow" & Sex == "M") %>% select("Bodyweight") %>% unlist
sd_y <- popsd(y)
mean_y <- mean(y)
pnorm(sd_y,mean = mean_y, sd= sd_y)-
  pnorm(-sd_y,mean = mean_y, sd= sd_y)
pnorm(sd_y,sd = sd_y)-pnorm(-sd_y,sd = sd_y)
pnorm(sd_y,mean = mean_y, sd= sd_y)-
  pnorm(0,mean = mean_y, sd= sd_y)
pnorm(sd_y, sd= sd_y)-
  pnorm(0, sd= sd_y)
pnorm(1,mean = mean_y, sd= sd_y)-
  pnorm(-1,mean = mean_y, sd= sd_y)

#correct answer
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
mean( abs(z) <=3 )
z
qqnorm(z)
abline(0,1)

y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)
mean(avgs)
popsd(avgs)


control <- filter(dat,Diet=="chow") %>% select("Bodyweight") %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select("Bodyweight") %>% unlist
diff <- mean(treatment) - mean(control)

se <- sqrt(var(treatment)/length(treatment) +
  var(control)/length(control))
tstat <- diff/se
righttail <- 1- pnorm(abs(tstat))
lefttail <- pnorm(-abs(tstat))
pval <- righttail +lefttail
print(pval)
