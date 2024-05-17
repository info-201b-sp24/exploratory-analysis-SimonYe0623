library(dplyr)
library(knitr)
library(tidyr)
sleep_dataset<- read.csv("Sleep_health_and_lifestyle_dataset.csv")

#Numerical Summary Table
numerical_summary <- sleep_dataset %>%
  select(Age, `Sleep.Duration`, `Quality.of.Sleep`, `Physical.Activity.Level`, `Stress.Level`, `Heart.Rate`, `Daily.Steps`) %>%
  summarise(across(.cols = everything(),
                   .fns = list(Mean = ~mean(., na.rm = TRUE),
                               Median = ~median(., na.rm = TRUE),
                               SD = ~sd(., na.rm = TRUE),
                               Min = ~min(., na.rm = TRUE),
                               Max = ~max(., na.rm = TRUE)))) %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Summary") %>%
  separate(Variable, into = c("Variable", "Statistic"), sep = "_") %>%
  spread(key = Statistic, value = Summary)

#Categorical Summary Table
categorical_summary <- sleep_dataset %>%
  select(Gender, Occupation, `BMI.Category`, `Blood.Pressure`, `Sleep.Disorder`) %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Category") %>%
  group_by(Variable, Category) %>%
  summarise(Frequency = n(), .groups = 'drop')

#Summary Table
combined_summaries <- bind_rows(numerical_summary, categorical_summary)
summary_table <- kable(combined_summaries, caption = "Comprehensive Summary Statistics", format = "markdown")
print(summary_table)
