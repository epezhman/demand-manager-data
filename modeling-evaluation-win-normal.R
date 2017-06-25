library(lattice)
library(DAAG)
library(broom)
setwd("~/exports")

set.seed(123)
par(mfrow = c(1, 1))

train.win.nr.index <-
  sample(1:nrow(filtered.windows.normal),
         0.8 * nrow(filtered.windows.normal))
train.win.nr <- filtered.windows.normal[train.win.nr.index,]
test.win.nr  <- filtered.windows.normal[-train.win.nr.index,]

md.win.nr <-
  lm(
    real.power ~ battery.rate  + I(battery.rate ^ 2) + charging.status +  battery.rate:brightness  + battery.rate:battery.capacity  +
      cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
    data = train.win.nr
  )

tidy.md.win.nr <- tidy(md.win.nr)
write.csv(tidy.md.win.nr, "_windows_normal_coef.csv")

summary(md.win.nr)

coefficients(md.win.nr)
mean(residuals(md.win.nr))

AIC(md.win.nr)
BIC(md.win.nr)
pred.win.nr = predict(md.win.nr, test.win.nr)

actual.pred.win.nr <-
  data.frame(cbind(actuals = test.win.nr$real_power, predicteds = pred.win.nr))
correlation.accuracy.win.nr <- cor(actual.pred.win.nr)

min.max.accuracy.win.nr <-
  mean(apply(actual.pred.win.nr, 1, min) / apply(actual.pred.win.nr, 1, max))
mape.win.nr <-
  mean(abs(actual.pred.win.nr$predicteds - actual.pred.win.nr$actuals) / actual.pred.win.nr$actuals)

#boxplot(filtered.windows.normal$real_power, main="real_power", sub=paste("Outlier rows: ", boxplot.stats(filtered.windows.normal$real_power)$out))