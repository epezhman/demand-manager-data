Sys.setlocale("LC_TIME", "C")

setwd("~/exports/experiment_data/")

library(ggplot2)
theme_set(theme_bw())

# p1.mean <-
#   ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex3.mean) +   geom_point() +
#   geom_smooth(span =  0.8) +
#   labs(x = "Time",
#        y = "Real Power (watts)",
#        title = "First experiment with average of measured real power") +
#   geom_vline(
#     xintercept =  as.numeric(as.POSIXlt("2017-06-21 13:55:23")),
#     linetype = 4,
#     colour = "black"
#   )
#
#
# p1.median <-
#   ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex3.median) +   geom_point() +
#   geom_smooth(span = 0.8) +
#   labs(x = "Time",
#        y = "Real Power (watts)",
#        title = "First experiment with median of measured real power") +
#   geom_vline(
#     xintercept =  as.numeric(as.POSIXlt("2017-06-21 13:55:23")),
#     linetype = 4,
#     colour = "black"
#   )


#######################################################################################################
# p2.mean <-
#   ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex4.mean) +   geom_point() +
#   geom_smooth(span =  0.8) +
#   labs(x = "Time",
#        y = "Real Power (watts)",
#        title = "Second experiment with average of measured real power") +
#   geom_vline(
#     xintercept =  as.numeric(as.POSIXlt("2017-06-21 14:10:27")),
#     linetype = 4,
#     colour = "black"
#   )
#
# p2.median <-
#   ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex4.median) +   geom_point() +
#   geom_smooth(span = 0.8) +
#   labs(x = "Time",
#        y = "Real Power (watts)",
#        title = "Second experiment with median of measured real power") +
#   geom_vline(
#     xintercept =  as.numeric(as.POSIXlt("2017-06-21 14:10:27")),
#     linetype = 4,
#     colour = "black"
#   )

#######################################################################################################
p3.mean <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex5.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "First experiment with average of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 14:51:28")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

p3.median <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex5.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "First experiment with median of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 14:51:28")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

#######################################################################################################
p4.mean <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex6.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Second experiment with average of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:10:23")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

p4.median <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex6.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Second experiment with median of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:10:23")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )
#######################################################################################################
p5.mean <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex7.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Third experiment with average of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:25:31")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

p5.median <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex7.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Third experiment with median of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:25:31")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

#######################################################################################################
p6.mean <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex8.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fourth experiment with average of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:35:48")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

p6.median <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex8.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fourth experiment with median of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:35:48")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

#######################################################################################################
p7.mean <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex9.mean) +   geom_point() +
  geom_smooth(span =  0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fifth experiment with average of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:46:25")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

p7.median <-
  ggplot(aes(x = Time, y = RealPower , col = Participants), data = ex9.median) +   geom_point() +
  geom_smooth(span = 0.8) +
  labs(x = "Time",
       y = "Real Power (watts)",
       title = "Fifth experiment with median of measured real power") +
  geom_vline(
    xintercept =  as.numeric(as.POSIXlt("2017-06-21 15:46:25")),
    linetype = 4,
    colour = "black"
  ) + theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 16)
  )

#######################################################################################################

# print(p1.mean)
# print(p2.mean)
print(p3.mean)
print(p4.mean)
print(p5.mean)
print(p6.mean)
print(p7.mean)

# print(p1.median)
# print(p2.median)
print(p3.median)
print(p4.median)
print(p5.median)
print(p6.median)
print(p7.median)

# multiplot(p1.mean,
#           p2.mean,
#           cols = 2)

# multiplot(p3.mean,
#           p4.mean,
#           cols = 2)
#
# multiplot(p5.mean,
#           p6.mean,
#           cols = 2)
#
# multiplot(p7.mean,
#           cols = 2)
#
# # multiplot(p1.median,
# #           p2.median,
# #           cols = 2)
#
# multiplot(p3.median,
#           p4.median,
#           cols = 2)
#
# multiplot(p5.median,
#           p6.median,
#           cols = 2)
#
# multiplot(p7.median,
#           cols = 2)
