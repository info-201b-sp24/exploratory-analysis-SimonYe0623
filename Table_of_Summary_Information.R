library(dplyr)
library(knitr)
library(tidyr)
sleep_dataset<- read.csv("Sleep_health_and_lifestyle_dataset.csv")

aggregated_data <- sleep_dataset %>%
  group_by(Occupation) %>%
  summarise(
    Sleep_Duration = mean(Sleep.Duration, na.rm = TRUE),
    Quality_of_Sleep = mean(Quality.of.Sleep, na.rm = TRUE),
    Physical_Activity_Level = mean(Physical.Activity.Level, na.rm = TRUE),
    Stress_Level = mean(Stress.Level, na.rm = TRUE),
    Heart_Rate = mean(Heart.Rate, na.rm = TRUE),
    Daily_Steps = mean(Daily.Steps, na.rm = TRUE)
  )

print(aggregated_data)
