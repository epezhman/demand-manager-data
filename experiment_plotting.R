Sys.setlocale("LC_TIME", "C")

setwd("~/exports/experiment_data/")

library(ggplot2)
theme_set(theme_bw())


ggplot(aes(x = time, y = pezh.jose.mr.nejc.mean, group = 1), data = ex3) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

ggplot(aes(x = time, y = pezh.jose.mr.nejc.median, group = 1), data = ex3) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

#######################################################################################################
ggplot(aes(x = time, y = pezh.jose.mr.nejc.mean, group = 1), data = ex4) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

ggplot(aes(x = time, y = pezh.jose.mr.nejc.median, group = 1), data = ex4) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

#######################################################################################################
ggplot(aes(x = time, y = pezh.jose.mr.mean, group = 1), data = ex5) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

ggplot(aes(x = time, y = pezh.jose.mr.median, group = 1), data = ex5) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

#######################################################################################################
ggplot(aes(x = time, y = pezh.jose.mr.mean, group = 1), data = ex6) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

ggplot(aes(x = time, y = pezh.jose.mr.median, group = 1), data = ex6) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

#######################################################################################################
ggplot(aes(x = time, y = pezh.jose.mr.mean, group = 1), data = ex7) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

ggplot(aes(x = time, y = pezh.jose.mr.median, group = 1), data = ex7) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

#######################################################################################################
ggplot(aes(x = time, y = pezh.jose.mr.mean, group = 1), data = ex8) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

ggplot(aes(x = time, y = pezh.jose.mr.median, group = 1), data = ex8) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

#######################################################################################################
ggplot(aes(x = time, y = pezh.jose.mean, group = 1), data = ex9) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

ggplot(aes(x = time, y = pezh.jose.median, group = 1), data = ex9) +   geom_point() +
  geom_smooth(span = 1) +
  labs(x = "Time",
       y = "Real Power (watts)")

#######################################################################################################