library(DAAG)
library(broom)
setwd("~/exports")

set.seed(123)
par(mfrow = c(1, 1))

train.win.sv.index <-
  sample(1:nrow(filtered.windows.save),
         0.8 * nrow(filtered.windows.save))
train.win.sv <- filtered.windows.save[train.win.sv.index,]
test.win.sv  <- filtered.windows.save[-train.win.sv.index,]

md.win.sv <-
  lm(
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
    data = train.win.sv
  )

tidy.md.win.sv <- tidy(md.win.sv)
write.csv(tidy.md.win.sv, "_windows_save_coef.csv")

summary(md.win.sv)

coefficients(md.win.sv)
mean(residuals(md.win.sv))

AIC(md.win.sv)
BIC(md.win.sv)
pred.win.sv = predict(md.win.sv, test.win.sv)

actual.pred.win.sv <-
  data.frame(cbind(actuals = test.win.sv$real_power, predicteds = pred.win.sv))
correlation.accuracy.win.sv <- cor(actual.pred.win.sv)

min.max.accuracy.win.sv <-
  mean(apply(actual.pred.win.sv, 1, min) / apply(actual.pred.win.sv, 1, max))
mape.win.save <-
  mean(abs(actual.pred.win.sv$predicteds - actual.pred.win.sv$actuals) / actual.pred.win.sv$actuals)

cross.val.win.sv <-
  suppressWarnings(
    cv.lm(
      data = filtered.windows.save,
      form.lm =   real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
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
attr(cross.val.win.sv, 'ms')

#boxplot(filtered.windows.save$real_power, main="realpower", sub=paste("Outlier rows: ", boxplot.stats(filtered.windows.save$real_power)$out))

