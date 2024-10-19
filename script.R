# configure parameters
x <- 1 # 元手資金
a <- 1.1 # 年初 ~ 天井の倍率
b <- 1.08 # 年初 ~ 底の倍率
c <- a / b
e <- 0.2 # 税金

# define axis
N <- seq(0, 15, by=1.0)

# define functions
y1 <- (
  1 + (a**N - 1) * (1 - e)
) * x

y2 <- (
  a * c * (1 - e) + e
) ** N * x

# plot graph
plot(N, y1, type="l", col="red", xlab="year", ylab="total including taxes/gains", main="investment simulation")
lines(N, y2, col="blue")

# legend
legend("topleft",
  legend=c(
    paste("Never sell: "),
    paste("Take profits frequently: ")
  ),
  col=c("red", "blue"),
  lty=1
)
text(0, max(y1) * 0.90, expression(red: y[1] == (1 + (a^N - 1) * (1 - e)) * x), adj=0)
text(0, max(y1) * 0.85, expression(blue: y[2] == (a * c * (1 - e) + e) ** N * x), adj=0)

# text on graph
text(0, max(y1) * 0.80, paste("a = ", a), adj=0)
text(0, max(y1) * 0.75, paste("b = ", b), adj=0)
text(0, max(y1) * 0.70, paste("c = a / b"), adj=0)
text(0, max(y1) * 0.65, paste("e = ", e), adj=0)
