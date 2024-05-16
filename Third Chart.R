library(ggplot2)

sleep_dataset <- read_csv("Desktop/Spring24/INFO 201/Sleep_health_and_lifestyle_dataset.csv")

ggplot(sleep_dataset, aes(x = Age, fill = `Sleep Disorder`)) +
  geom_histogram(bins = 30, position = "dodge", alpha = 0.6) +
  labs(title = "The Effect of Age on Sleep Disorders", x = "Age", y = "Count")