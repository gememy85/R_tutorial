# function

say.hello <- function(){
  print("hello, world")
}

say.hello()
sprintf("hello %s", "Jared")
sprintf("hello %s, today is %s", "Jared", "Sunday")

hello.person <- function(name)
{
  print(sprintf("Hello %s", name))
}
hello.person("wonseok")

hello.person<- function(first, last){
  print(sprintf("Hello %s %s", first, last))
}
hello.person("Jared","Lander")
hello.person(last="Jared", first = "Lander")
hello.person(last="Jared", "Lander") # 이렇게 해도 R은 인식한다.


hello.person <- function(first, last="Doe"){ # 이렇게 default argument를 설정할 수 있다.
  print(sprintf("Hello %s %s", first, last))
}
hello.person("Jared")
hello.person("Jared","Lander")

hello.person("Jared", extra="Goodbye") # 이렇게 하면 extra라는 변수가 없으므로 에러가 뜬다.
# ... 을 이용해보자.
# 이것은 아주 어려운 문법이다.
# 이해하는 게 추후 도움이 될 것이다.

hello.person <- function(first, last="DOE", ...){
  print(sprintf("Hello %s %s", first, last))
}
hello.person("Jared", "Lander", "Goodbye") # 에러가 뜨지 않는 것을 볼 수 있다.
hello.person("Jared", extra="Goodbye")


# Return a value from a function
double.num <- function(x){
  x*2 #R은  마지막 line을 리턴한다.
}
double.num(2)
double.num <- function(x){
  return(x*2)
}
double.num(3)

double.num <- function(x){
  return(x*2) # 리턴 다음 줄들은 실행되지 않는 것을 볼 수 있다.

  print("Hello!")
  return(17)
}
double.num(3)


# do.call 에 대해서 알아보자.
hello.person <- function(first, last="DOE", ...){
  print(sprintf("Hello %s %s", first, last))
}
hello.person("Jared","Lander")
do.call("hello.person", args=list(first="Jared", last="Lander")) # do.call의 방식으로 함수를 호출할 수 있다.
do.call(hello.person, args=list(first="Jared", last="Lander"))

run.this <- function(x, func=mean){
  do.call(func, args=list(x))
}
run.this(1:10)
run.this(1:10, sum)
run.this(1:10, sd) # 이런 식으로 함수 사용을 굉장히 쉽고 간편하게 만들 수 있다.

# if에 대해서 알아보자.
1 == 1
1 < 1
toCheck <- 1
if(toCheck == 1){
  print("Hello")
}

toCheck <- 0
if(toCheck == 1){
  print("Hello")
}else{"not 1"}

# 다른 if문에 대해서 알아보자. ifelse도 알아보자.
check.bool <- function(x){
  if(x == 1){
    print("Hello")
  } else {
    print("Goodbye")
  }
}
check.bool("wonseok")
check.bool <- function(x){
  if(x == 1){
    # anything after this symbol is a comment
    # ignored by computer
    # 이런식으로 주석을 쓸 수 있다.
   print("Hello")
  } else if(x == 0){
    print("Goodbye")
  } else{
    print("Confused")
  }
}
check.bool(1)


# function extended
use.switch <- function(x){
  switch(x,
         "a"="first",
         "b"="second",
         "z"="last",
         "c"="third",
         "other") # other은 디폴트값이 된다.
}
use.switch("a")
use.switch("b")
use.switch(1) # 선언했던 순서대로 그 값들을 반환하는 것을 볼 수 있다.
use.switch(3)
use.switch(5)
use.switch(6) # Null이 반환된다.
use.switch("hello")

# ifelse를 이용해보자. vector연산에 쓸 수 있다.
ifelse(1==1, "Yes","No")
ifelse(1==0, "Yes","No")

toTest <- c(1,1,0,1,0,1)
ifelse(toTest==1, "Yes", "No")
ifelse(toTest==1, toTest*3, toTest) # 맞는 값들만 계산을 진행해주고 아닌 경우에는 그대로 놔두는 연산이 진행된다!
ifelse(toTest==1, toTest*3, "Zero") # 모두 character로 반환된 것을 볼 수 있다. 모두 타입이 같아야 하므로..

toTest[2] <- NA
toTest
ifelse(toTest == 1, toTest*3, "Zero") # NA는 놔두고 연산이 진행된다! 이것도 굉장히 편리한 기능이다.






