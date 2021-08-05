# matrix
A <- matrix(1:10, nrow=5)
A

B <- matrix(21:30, nrow=5)
C <- matrix(21:40, nrow=5)

nrow(B)
dim(A)
A + B # element-wise 연산이 가능하다.
A == B
A*B # 요소끼리 곱할 수 있다.

t(A) # 이렇게 해주면 transpose 가능
A %*% t(B) # matrix 연산 가능

colnames(A)
rownames(A)
colnames(A) <- c("Left","Right")
rownames(A) <- c("1st","2nd","3rd","4th", "5th")
A


colnames(C) <- LETTERS[1:4]
C

###################################################################
# read csv
dataset<-"http://www.jaredlander.com/data/Tomato%20First.csv"
tomato <- read.table(file=dataset, header=TRUE, sep=",") # read.csv보다 편하다. 어쩔 때는 read.csv2를 써야할 수도 있다.
# 여러가지 sep ="\t", ";"

class(tomato$Tomato) # factor로 변해있는 것을 볼 수 있다. 고로, str으로 바꿔주자
tomato <- read.table(file=dataset, header=TRUE, sep=",", stringsAsFactors = FALSE)
class(tomato$Tomato) # 달라진 것을 볼 수 있다.

# read excel
install.packages("readxl")
download.file("http://www.jaredlander.com/data/ExcelExample.xlsx", destfile = "ExcelExample.xlsx", mode = "wb")
library(readxl)
tomatoXL <- read_excel("ExcelExample.xlsx", sheet=1)
wineXL <- read_excel('ExcelExample.xlsx', sheet = "Wine") # xml도 읽을 수 있다.
head(wineXL)

install.packages("openxlsx")
library(openxlsx)
tomatoXL1 <- read.xlsx("ExcelExample.xlsx", sheet=1)
head(tomatoXL1)

# read from database
require(RODBC)
db <- odbcConnect("QV Training")
db

ordersTable <- sqlQuery(db, "SELECT * from orders", stringsAsFactors=FALSE)
