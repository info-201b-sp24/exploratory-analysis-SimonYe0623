library(ggplot2)

sleep_dataset <- read_csv("Desktop/Spring24/INFO 201/Sleep_health_and_lifestyle_dataset.csv")

ggplot(sleep_dataset, aes(x = `Physical Activity Level`, y = `Quality of Sleep`,  
                          color = `Physical Activity Level`)) + 
  geom_point()  + geom_smooth(method="lm", se=FALSE, col="grey25") +
  labs(title = "Impact of Daily Physical Activity Level on Sleep Quality",
       subtitle = "Sleep Quality rating on scale: 1-10",
       x = "Physical Activity Level(minutes/day)", y = "Sleep Quality")