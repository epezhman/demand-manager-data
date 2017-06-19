library(lattice)
library(ggplot2)
library(caret)
library(leaps)
library(DAAG)
library(MASS)
library(klaR)

# md.ub.sv8 <-
#   lm(
#     real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + brightness_percent + cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
#     data = filtered.ubunutu.save
#   )


# summary(md.ub.sv1) # show results
#
# coefficients(md.ub.sv1) # model coefficients
# confint(md.ub.sv1, level = 0.95) # CIs for model parameters
# fitted(md.ub.sv1) # predicted values
# residuals(md.ub.sv1) # residuals
# anova(md.ub.sv1) # anova table
# vcov(md.ub.sv1) # covariance matrix for model parameters
# influence(md.ub.sv1) # regression diagnostics
#
# par(mfrow = c(2, 2))
# plot(md.ub.sv1)
#
# anova(md.ub.sv7, md.ub.sv8)

# md.daag <- cv.lm(
#   data = filtered.ubunutu.save,
#   form.lm = formula(real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
#                       brightness_percent + cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request),
#   m = 3,
#   seed = 123,
#   printit = TRUE
# )

# library(MASS)
# step <- stepAIC(md.ub.sv8, direction = "both")
# step$anova

leaps <-
  regsubsets(
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      brightness_percent + cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
    data = filtered.ubunutu.save,
    nbest = 5,
    # 1 best model for each number of predictors
    nvmax = NULL,
    # NULL for no limit on number of variables
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
summary(leaps)

par(mfrow = c(2, 2))
plot(leaps, scale = "r2")
plot(leaps, scale = "adjr2")
plot(leaps, scale = "bic")

summary.out <- summary(leaps)
which.max(summary.out$adjr2)
summary.out$which[26,]

# library(car)
# subsets(leaps, statistic = "rsq")

# smp_size <- floor(0.80 * nrow(filtered.ubunutu.save))
# set.seed(123)
# train_ind <- sample(seq_len(nrow(filtered.ubunutu.save)), size = smp_size)
# train.f.ub.sv <- filtered.ubunutu.save[train_ind, ]
# test.f.ub.sv <- filtered.ubunutu.save[-train_ind, ]

# train_control <-
#   trainControl(method = "repeatedcv",
#                number = 10,
#                repeats = 3)
# model <-
#   train(
#     real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
#       brightness_percent + cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
#     data = train.f.ub.sv,
#     trControl = train_control,
#     method = "lm"
#   )
# # summarize results
# print(model)
# coef(model$finalModel)
# 
# predRF <- predict(model,test.f.ub.sv)
# confusionMatrix(test.f.ub.sv$real_power,predRF)
