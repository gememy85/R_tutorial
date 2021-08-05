# welcome to R tutorial!
# we are going to how to do R in few weeks

# 제대로 작동하는지 보는법
1+1
1+(3*5)

# history
# 어떤 명령을 실행했었는지 볼 수 있다.
# Environment
# 어떤 객체들이 저장되어 있는지 확인할 수 있다.
# console
# ?mean ?{명령어} 검색하면 관련 명령어가 help 창에 뜬다.
# plot
# plot을 그리면 plot 창에 plot이 나타나게 된다.

install.packages("ggplot2")
install.packages("coefplot")

# library, require 비슷한 거다.
library(ggplot2)
require(coefplot)
library(useful)

ggplot()

# Basic Math in R & Functions
1+1
1+2+3
7-5
2-5
3*4
3/4

# variables <-와 = 같은 할당자이지만 관행적으로 <-를 쓴다
x <-2
x
y = 5
y

a <- b<- 7 # 둘다 7이 된다.
assign("j", 4) # j는 4가 할당된다.

# remove variable
rm(j)
j

theVariable <- 17
theVariable

thevariable # 대문자가 구분되기 때문에 인식되지 못한다.

# data types
x <- 2
x
# class로 확인한다.
class(x); is.numeric(x)

i <-5L #  숫자 뒤에 L 붙이면 ineger된다.
i
class(i)
is.numeric(i) # numeric은 integer의 하위 집합이다.

5L/2L
class(5L/2L)

x <- "data"
x
class(x)

y <- factor("data") # factor로도 문자열 정의 가능하다.
y

nchar(x) # 단어의 수
nchar("hello")
nchar(100) # 숫자를 넣었을 경우 자릿수를 반환한다.
nchar(y) # nchar는 factor랑 연동되지 못한다.

date1 <- as.Date("2021-05-20")
class(date1)
as.numeric(date1) # 유닉스가 처음 만들어진 시점으로부터의 날짜 길이

date2 <- as.POSIXct("2021-05-20 20:01")
date2
class(date2) # POSIXct로 manipulate하는게 편하다.
as.numeric(date2)

# logical
TRUE; FALSE
TRUE*5 # TRUE는 1
FALSE*5 # FALSE는 0

k <- TRUE
k
class(k)

T; F # 기본적으로는 TRUE/FALSE 이지만 유용하진 않다.

2 == 3
2 != 3
2 <= 3

"data" == "stats"
"data" < "stats" # 길이에 대한 연산이 진행된다.

# vector
# c라는 것으로 생성
x <- c(1:10) # (1,2,3,4,5,6,7,8,9,10) 도 가능
x

x * 3 # 전체가 3으로 곱해진다.
x + 2 # 전체가 2로 더해진다.
x ^2
sqrt(x) # 벡터 연산이 아주 편하다.

1:10
10:1
-2:3
3:-2

x <- 1:10
y <- -5:4
x + y
x / y
x * y  # element-wise 연산이 가능하다.

x ^ y
length(y)
length(x+y)

x + c(1,2) # 1,2가 반복적으로 더해진다.
x + c(1,2,3) # 이럴 경우 warning이 뜨긴한다.

sum(x <= 5)
y > x

x <- 10:1
y <- -4:5
x < y
any(x < y ) # 이 중 하나라도 TRUE인지
all(x < y ) # 전부 TRUE 인지

q <- c("Hockey", "Football","Baseball","Curling","Rugby","Lacrosse","Basketball",
       "Tennis","Soccer")
q
nchar(q)
f <- 7
f # 사실 R에서는 모든 것이 벡터다. [1]은 길이가 1이라는 뜻이다.

f[1] # 이렇게 하면 첫번째에 7이 저장된 것을 볼 수 있다.
x[1:2]
x[c(1,4)] # 이렇게하면 해당 번째의 값을 구할 수 있다.

# 벡터에 이름 부여하기
c(One="a", Two="y", Last="r")
w <- 1:3
w
names(w) <- c("a", "b", "c") # 벡터에 이름을 주었다. 파이썬의 딕셔너리 같다.
w["a"]

q
q2 <- c(q, "Hockey", "Lacrosse", "Hockey","Water Polo")
q2

q2Factor <- factor(q2)
q2Factor # levels들은 들어있는 요소들이고 그 요소들은 사실 숫자가 할당되어 있다.
as.numeric(q2Factor) # 이런 식으로 하면 할당 되었던 숫자들을 반환한다.

z <- c(1,2, NA, 8, 3, NA, 3)
z
msk<- is.na(z)
z[msk]

zChar <- c("Hockey", NA, "Lacrosse")
zChar
is.na(zChar)


z <- c(1, NULL, 3) # Null은 그냥 없는 녀석 취급된다. NA랑 다르다.
z

d <- NULL
d
is.null(d)

# inline Functions

x <- 1:10
mean(x)
sum(x)
mean(x=x, trim=.1)
mean(x, .1)

x[c(2,6)] <- NA
x
mean(x)
mean(x, na.rm=TRUE) # 이렇게 했을 경우 안에 들어있는 NA 값 제외하고 계산이 이뤄진다.

# Data Structures
#1. data frame
x <- 10 : 1
y <- -4 : 5
q <- c("Hockey","Football","Baseball","Curling","Rugby","Lacrosse","Basketball","Golf","Swimming", "Taekwondo")
theDF <- data.frame(x, y, q)
theDF
theDF <- data.frame(First=x, Second=y, Sport=q)# 이름도 지정해줄 수 있다.
theDF

class(theDF$Sport) # 다 factor가 된다. 그래서 바꿔주는 게 더 편하다.

theDF <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors = FALSE)# 이렇게 해주면 factor로 변환되는 것을
# 막아준다.
class(theDF$Sport)

nrow(theDF)
ncol(theDF)
dim(theDF)

NROW(theDF) # NROW를 쓰면 그냥 벡터에도 사용이 가능하다.
NROW(x)

names(theDF)
names(theDF)[3]

rownames(theDF)
rownames(theDF) <- c("one","two","three","four","five","six","seven","eight","nine","ten")
rownames(theDF)

rownames(theDF) <- NULL # 이렇게 해줄 경우 그냥 원래 상태로 1~ 순서대로 인덱싱해준다.

head(theDF,3)
tail(theDF, 3)
class(theDF)


theDF$Sport # 컬럼을 벡터로 불러오는 법
theDF[3,2] # 3번째 행의 2번째 컬럼
theDF[3, 2:3] # 3번째 행의 2~3번째 컬럼
theDF[c(3,5), 2] # 3, 5번째 행의 2번쨰 컬럼
theDF[c(3,6), 2:3]

theDF[, c(1,3)] # 모든 행과 2,3번째 컬럼
class(theDF[,3])
theDF[,3,drop=FALSE] # drop=False로 하면 데이터 프레임 반환.

theDF[2, ] #이렇게 했을 경우 vector를 반환하지 않는다. # 이유는 컬럼마다 데이터 타입이
# 달라지기 때문에 그렇다.

theDF[,c("First","Sport")]
theDF[,"Sport", drop=FALSE]
theDF["Sport"] # 이렇게 할 경우 dataframe 반환
theDF[["Sport"]]# 이렇게 할 경우 vector를 반환
theDF[c("First","Second")]


# list
list1 <- list(1,2,3)
list1

list2 <- list(c(1,2,3))
list2

list3 <- list(c(1,2,3), 3:7)
list3

theDF <- data.frame(First=1:5, Second=5:1,
                    Sport=c("Hockey", "Lacrosse", "Football","Curling","Tennis"),
                    stringsAsFactors = FALSE)
theDF

list4 <- list(theDF, 1:10) # 리스트 속에 데이터 프레임이 들어가 있다!
list4

list5 <- list(theDF, 1:10, list3)
list5


names(list5)
names(list5) <- c("data.frame","vector","list")
names(list5)
list5


list6 <- list(TheDataFrame=theDF, TheVector=1:10, TheList=list3)
names(list6)
list6

# R에서는 먼저 빈 리스트를 만들고 채우는 연산이 효율적이다.
emptyList <- vector(mode="list", length=4)
emptyList

emptyList[[1]] <- 5
emptyList

names(list5[[1]]) # 숫자로 불러올 수 있다.
list5[["data.frame"]] # 이렇게 이름으로 불러올 수도 있다.

list5[[1]]["Sport"]
list5[[1]][,"Sport", drop=FALSE]

length(list5)
NROW(list5)

list5[[4]] <-2
list5[["NewElement"]] <- 3:6
list5
names(list5)[4] <- "Fourth"
names(list5)
list5[["Fourth"]]
list5


