Sys.setlocale("LC_TIME", "C")

setwd("~/exports/experiment_data/")

library(ggplot2)
theme_set(theme_bw())

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex3.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "First experiment with average of measured real power")

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex3.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "First experiment with median of measured real power")


#######################################################################################################
ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex4.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Second experiment with average of measured real power")

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex4.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Second experiment with median of measured real power")

#######################################################################################################
ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex5.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Third experiment with average of measured real power")

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex5.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Third experiment with median of measured real power")

#######################################################################################################
ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex6.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fourth experiment with average of measured real power")

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex6.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fourth experiment with median of measured real power")
#######################################################################################################
ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex7.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fifth experiment with average of measured real power")

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex7.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fifth experiment with median of measured real power")

#######################################################################################################
ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex8.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Sixth experiment with average of measured real power")

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex8.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Sixth experiment with median of measured real power")

#######################################################################################################
ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex9.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Seventh experiment with average of measured real power")

ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex9.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Seventh experiment with median of measured real power")

#######################################################################################################