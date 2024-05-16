library(ggplot2)

sleep_dataset <- read_csv("Desktop/Spring24/INFO 201/Sleep_health_and_lifestyle_dataset.csv")

ggplot(sleep_dataset, aes(x = Gender, y = `Quality of Sleep`, fill = Gender)) +
  geom_boxplot() + 
  labs(title = "Comparision of Sleep Quality Bewtweens Genders",
       subtitle = "Sleep Quality rating on scale: 1-10",
       x = "Gender", y = "Sleep Quality")
