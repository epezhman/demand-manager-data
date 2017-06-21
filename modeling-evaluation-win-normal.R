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
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
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


cross.val.win.nr <-
  suppressWarnings(
    cv.lm(
      data = filtered.windows.normal,
      form.lm =  real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
        cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
      m = 5,
      dots = FALSE,
      seed = 123,
      legend.pos = "topleft",
      printit = FALSE,
      main = "Small symbols are predicted values while bigger ones are actuals."
    )
  )
# performs the CV
attr(cross.val.win.nr, 'ms')

#boxplot(filtered.windows.normal$real_power, main="real_power", sub=paste("Outlier rows: ", boxplot.stats(filtered.windows.normal$real_power)$out))

