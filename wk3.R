tomato <- read.table("data/Tomato First.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)
head(tomato)
# 저장하는 법
save(tomato, file="data/tomato.rdata")
rm(tomato)
load("data/tomato.rdata")
head(tomato)

# 여러 객체를 저장해보자.
n <- 20
r <- 1:10
w <- data.frame(n, r)
w
save(n, r, w, file="muliple.rdata")
rm(n, r, w)
load("muliple.rdata")
n
r
w

# ggplot 을 이용해보자.
require(ggplot2)
data(diamonds)
head(diamonds)

data("tips", package = "reshape2")
head(tips)

data() # 이렇게 available한 데이터가 뭔지, 어느 패키지에 있는지 알려준다.

# 웹에서 데이터를 scrap 해오기
# xml을 이용한다.
install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlGame <- readHTMLTable(theURL, which=1, header=FALSE, stringsAsFactors=FALSE) # which는 몇번째 테이블인지 알려준다.
bowGame


# visualizing data
# ggplot에 대해서 알아보도록 해보자.
require(ggplot2)
data(diamonds)
head(diamonds) # 이 데이터로 시각화를 연습해보자..

# histogram
hist(diamonds$carat, xlab = "Carat", main="Carat histogram")

# scatter plot
plot(diamonds$carat, diamonds$price)
plot(price ~ carat, data=diamonds) # ~ 표시는 formula 형식이라고 부른다.
plot(price ~ carat, data=diamonds, main="Price vs Carat")

# box plot
boxplot(diamonds$carat)

# ggplot 이용 -훨씬 이쁘게 나온다.
ggplot(data)
#geom_point
#geom_histogram
#aes(x, y)
# ggplot(data) + geom_point(aes(x, y))--> 이런 식으로 짠다. 이제 직접 짜보자.

ggplot(data=diamonds) + geom_histogram(aes(x=carat))
ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth = .1) # binwidth를 설정하여 시각화 가능

ggplot(data=diamonds) + geom_density(aes(x=carat))
ggplot(data=diamonds) + geom_density(aes(x=carat), fill="green")

# 이번에는 aes를 ggplot 안에 넣어보자. 상황에 따라 달라질 수 있다.
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
g <- ggplot(diamonds, aes(x=carat, y=price)) # 이런 식으로 변수로 선언해보자.
g + geom_point() # 이렇게 해도 위에 했던 것과 같게 나온다.

g + geom_point(aes(color=color))
g + geom_point(aes(color=color, shape=clarity))
g + geom_point(aes(color=color, shape=cut))

# ggplot 을 이용한 boxplot
ggplot(diamonds, aes(y=carat, x=1)) + geom_boxplot() # x=1은 필요없지만, r 문법상 필요하므로 선언해줌
ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot() # cut에 따라 분포를 볼 수 있다.

ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin()
g <- ggplot(diamonds, aes(y=carat, x=cut))
g + geom_point() + geom_violin()
g + geom_jitter() + geom_violin()
# 굉장히 다양한 방식으로 시각화를 할 수 있겠다.

# line plot
data("economics")
ggplot(economics, aes(x=date, y=pop)) + geom_line()
require(lubridate)
economics$year <- year(economics$date)
economics$month <- month(economics$date)
head(economics)

econ2000 <- economics[which(economics$year >= 2000),]
nrow(econ2000)

head(econ2000)
econ2000$month <- month(econ2000$date, label=TRUE)
econ2000

require(scales)
g <- ggplot(econ2000, aes(x=month, y=pop))
g <- g + geom_line(aes(color=factor(year), group=year))
g
g <- g + scale_color_discrete(name="Year")
g <- g + scale_y_continuous(labels=comma)
g <- g + labs(title="population growth", x="month", y="population")
g
g <- theme(x=element_text(angle=90, hjust=1))
g


# create small multiples
# facet을 이용해서 여러개의 플롯을 한번에 그릴 수 있다.
g <- ggplot(diamonds, aes(x=carat, y=price))
g + geom_point(aes(color=color)) + facet_wrap(~color)
g + geom_point(aes(color=color)) + facet_wrap(cut~clarity)

ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color) # 컬러 변수에 따라 플롯을 해본 것이다.

# ggplot을 제대로 이용해보자.
ggplot(diamonds, aes(x=carat, y=price, color=color, shape=cut, size=depth)) + geom_point()

g <- ggplot(diamonds, aes(x=carat, y=price, color=color, shape=cut, size=depth)) + geom_point()
g + theme_dark()

# ggviz -> java로 나오는 코드
