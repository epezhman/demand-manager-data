set.seed(123)

train.ub.normal.index <-
  sample(1:nrow(filtered.ubunutu.normal),
         0.8 * nrow(filtered.ubunutu.normal))
train.ub.nr <- filtered.ubunutu.normal[train.ub.normal.index,]
test.ub.nr <- filtered.ubunutu.normal[-train.ub.normal.index,]

md.ub.nr <-
  lm(
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      brightness_percent + cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
    data = train.ub.nr
  )

summary(md.ub.nr)

coefficients(md.ub.nr)
mean(residuals(md.ub.nr))

AIC(md.ub.nr)
BIC(md.ub.nr)
pred.ub.nr = predict(md.ub.nr, test.ub.nr)

actual.pred.ub.nr <-
  data.frame(cbind(actuals = test.ub.nr$real_power, predicteds = pred.ub.nr))
correlation.accuracy.ub.nr <- cor(actual.pred.ub.nr)

min.max.accuracy.ub.nr <-
  mean(apply(actual.pred.ub.nr, 1, min) / apply(actual.pred.ub.nr, 1, max))
mape.ub.nr <-
  mean(abs(actual.pred.ub.nr$predicteds - actual.pred.ub.nr$actuals) / actual.pred.ub.nr$actuals)

library(DAAG)

cross.val.ub.nr <-
  suppressWarnings(
    cv.lm(
      data = filtered.ubunutu.normal,
      form.lm =     real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
        brightness_percent + cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
      m = 5,
      dots = FALSE,
      seed = 123,
      legend.pos = "topleft",
      printit = FALSE,
      main = "Small symbols are predicted values while bigger ones are actuals."
    )
  )
# performs the CV
attr(cross.val.ub.nr, 'ms')


boxplot(filtered.ubunutu.normal$real_power, main="realpower", sub=paste("Outlier rows: ", boxplot.stats(filtered.ubunutu.normal$real_power)$out))

