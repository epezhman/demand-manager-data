library(lattice)
library(DAAG)
library(broom)
setwd("~/exports")

set.seed(123)
par(mfrow = c(1, 1))

train.ub.sv.index <-
  sample(1:nrow(filtered.ubunutu.save),
         0.8 * nrow(filtered.ubunutu.save))
train.ub.sv <- filtered.ubunutu.save[train.ub.sv.index,]
test.ub.sv  <- filtered.ubunutu.save[-train.ub.sv.index,]

md.ub.sv <-
  lm(
    real.power ~ battery.rate  + I(battery.rate ^ 2) + charging.status +   battery.rate:battery.capacity  +
      cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
    data = train.ub.sv
  )

tidy.md.ub.sv <- tidy(md.ub.sv)
write.csv(tidy.md.ub.sv, "_ubuntu_save_coef.csv")

summary(md.ub.sv)

coefficients(md.ub.sv)
mean(residuals(md.ub.sv))

AIC(md.ub.sv)
BIC(md.ub.sv)
pred.ub.sv = predict(md.ub.sv, test.ub.sv)

actual.pred.ub.sv <-
  data.frame(cbind(actuals = test.ub.sv$real_power, predicteds = pred.ub.sv))
correlation.accuracy.ub.sv <- cor(actual.pred.ub.sv)

min.max.accuracy.ub.sv <-
  mean(apply(actual.pred.ub.sv, 1, min) / apply(actual.pred.ub.sv, 1, max)) * 100
mape.ub.save <-
  mean(abs(actual.pred.ub.sv$predicteds - actual.pred.ub.sv$actuals) / actual.pred.ub.sv$actuals) * 100

#boxplot(filtered.ubunutu.save$real_power, main="realpower", sub=paste("Outlier rows: ", boxplot.stats(filtered.ubunutu.save$real_power)$out))