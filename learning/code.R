install.packages("rafalib")
library(rafalib)

install.packages("swirl")
library(swirl)
swirl()
a

1
1
1
1
5+7
x <- 5 + 7
x
y <- x - 3
y
z<-c(1.1,9,3.14)
?c
z
c(z,555,z)
z*2+100
my_sqrt <- sqrt(z-1)
1
my_sqrt
my_div <- z/my_sqrt
1
my_div
c(1,2,3,4) + c(0,10,100)
1
1
2
swirl()
a
1
2
getwd()
ls()
x <- 9
ls()
list.files()
?list.files
args(list.files)
old.dir <- getwd()
dir.create("testdir")
setwd("testdir")
file.create("mytest.R")
list.dirs()
list.files()
file.exists("mytest.R")
file.info("mytest.R")
file.info("mytest.R")$mode
file.rename("mytest.R","mytest2.R")
file.remove('mytest.R')
file.copy("mytest2.R","mytest3.R")
file.path("mytest3.R")
play()
?file.path
nxt()
file.path('folder1','folder2')
?dir.create
dir.create(file.path('testdir2','testdir3'), recursive = TRUE)
setwd(old.dir)
1
1
x = c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
mean(x)
swirl()
1:20
pi:10
15:1
?`:`
seq(1,20)
seq(0,10,by = 0.5)
my_seq <- seq(5,10,length.out = 30)
length(my_seq)
1:length(my_seq)
seq(along.with=my_seq)
seq_along(my_seq)
rep(0, times=40)
rep(c(0,1,2), times=10)
rep(c(0,1,2), each=10)
1
1
4
num_vect <- c(0.5,55,-10,6)
tf <- num_vect < 1
1
tf
num_vect >=6
1
1
1
my_char <- c("My", "name", "is")
my_char
paste(my_char, collapse = " ")
my_name <- c(my_char, "a")
my_name
paste(my_name,collapse = " ")
paste("Hello", "world!", sep = " ")
paste(1:3,c("X","Y","Z"),sep = "")
paste(LETTERS,1:4,sep = "-")
2
1
5
x <- c(44,NA,5,NA)
x*3
y <- rnorm(1000)
z <- rep(NA, 1000)
my_data <- sample(c(y,z),100)
my_na <- is.na(my_data)
my_na
my_data == NA
sum(my_na)
my_data
0/0
Inf-Inf
2
1
6
x
play()
sum(x)
play()
sum(x)
x
sum(is.na(x))
nxt()
x[1:10]
4
x[is.na(x)]
y <- x[!is.na(x)]
y
3
y[y>0]
x[x>0]
x[!is.na(x) & x>0]
x[c(3,5,7)]
x[0]
x[3000]
x[c(-2,-10)]
x[-c(2,10)]
vect <- c(foo=11,bar=2,norf=NA)
vect
names(vect)
vect2 <- c(11,2,NA)
names(vect2) <- c("foo","bar","norf")
identical(vect,vect2)
1
vect["bar"]
vect[c("foo","bar")]
1
1
7
my_vector <- 1:20
my_vector
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4,5)
dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix <- my_vector
?matrix
my_matrix2 <- matrix(1:20,4,5)
identical(my_matrix,my_matrix2)
patients <- c("Bill","Gina","Kelly","Sean")
cbind(patients,my_matrix)
my_data <- data.frame(patients,my_matrix)
my_data
play()
attributes(my_data)
nxt()
class(my_data)
cnames <- c("patient","age","weight","bp","rating","test")
colnames(my_data) <- cnames
my_data
1
1
8
TRUE==TRUE
(FALSE==TRUE)==FALSE
6==7
6<7
10 <=10
4
4
5!=7
!5==7
3
4
FALSE&FALSE
TRUE & c(TRUE,FALSE,FALSE)
TRUE && c(TRUE,FALSE,FALSE)
TRUE | c(TRUE,FALSE,FALSE)
TRUE || c(TRUE,FALSE,FALSE)
5 > 8 || 6 != 8 && 4 > 3.9
1
2
isTRUE(6>4)
5
play()
isTRUE(NA)
isTRUE(3)
nxt()
identical('twins','twins')
3
xor(5==6,!FALSE)
1
play()
8!=8.0
8==8.0
nxt()
ints <- sample(10)
ints
ints>5
which(c(TRUE,FALSE,TRUE))
which(ints>7)
1
any(ints<0)
all(ints>0)
4
1
1
0
0
swirl()
a
1
0
0
i <- seq(1,25)
i
j <- sum(i^2)
j
cars
class(cars)
attributes(cars)
dim(cars)
cnames(cars)
colnames(cars)
cars[,2]
mean(cars[,2])
which(cars[,2]==85)
swirl()
a
1
0
2
x <- 1:10
y <- rnorm(10)
plot(x,y)
f <- lm(y~x)
f
swirl()
a
1
9
Sys.Date()
mean(c(2,4,5))
submit()
boring_function('My first function!')
boring_function
submit()
my_mean(c(4,5,10))
submit()
remainder(5)
remainder(11,5)
remainder(divisor = 11,num=5)
remainder(4,div=2)
args(remainder)
submit()
evaluate(sd,c(1.4,3.6,7.9,8.8))
evaluate(function(x){x+1},6)
evaluate(function(x){x[1]},c(8,4,0))
evaluate(function(x){x[length(x)]},c(8,4,0))
?paste
paste("Programming","is","fun!")
submit()
telegram("hello")
submit()
mad_libs(place="dhaka",adjective="good",noun="boy")
submit()
'I' %p% 'love' %p% 'R!'
2
1
10
head(flags)
dim(flags)
play()
viewinfo()
dim(dat)
viewinfo()
nxt()
class(flags)
play()
View(dat)
nxt()
cls_list <- lapply(flags, class)
play()
as.list(flags)
nxt()
cls_list
class(cls_list)
as.character(cls_list)
cls_vect <- sapply(flags, class)
class(cls_vect)
play()
cls_vect
dim(cls_vect)
attributes(cls_vect)
dim(cls_list)
attributes(cls_list)
nxt()
sum(flags$orange)
flag_colors <- flags[,11:17]
head(flag_colors)
lapply(flag_colors,sum)
sapply(flag_colors,sum)
sapply(flag_colors, mean)
flag_shapes <- flags[,19:23]
View(flag_shapes)
nxt()
lapply(flag_shapes,range)
shape_mat <- sapply(flag_shapes, range)
shape_mat
class(shape_mat)
unique(c(3,4,5,5,5,6,6))
unique_vals <- lapply(flags, unique)
unique_vals
sapply(unique_vals, length)
sapply(flags,unique)
s<-lapply(unique_vals,function(elem) {elem[2]})
1
1
0
0
View(s)
swirl()
a
1
1
1
11
play()
dim(flags)
head(flags)
str(flags)
summary(flags)
viewinfo(flags)
viewinfo()
nxt()
sapply(flags,unique)
vapply(flags,unique,numeric(1))
ok()
sapply(flags,class)
vapply(flags,class,character(1))
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate,flags$landmass,mean)
tapply(flags$population, flags$red, summary)
5
tapply(flags$population,flags$landmass,summary)
2
1
1
12
ls()
class(plants)
dim(plants)
nrow(plants)
ncol(plants)
object.size(plants)
names(plants)
head()
head(plants)
head(plants,10)
play()
View(plants)
nxt()
tail(plants)
tail(plants,15)
summary(plants)
table(plants$Active_Growth_Period)
str(plants)
2
1
