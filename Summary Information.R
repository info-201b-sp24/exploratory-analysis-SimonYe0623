library(dplyr)
sleep_dataset<- read.csv("Sleep_health_and_lifestyle_dataset.csv")

#Numerical Summary
numerical_summary <- sleep_dataset %>%
  select(Age, `Sleep.Duration`, `Quality.of.Sleep`, `Physical.Activity.Level`, `Stress.Level`, `Heart.Rate`, `Daily.Steps`) %>%
  summarise(across(.cols = everything(),
                   .fns = list(Mean = ~mean(., na.rm = TRUE),
                               Median = ~median(., na.rm = TRUE),
                               SD = ~sd(., na.rm = TRUE),
                               Min = ~min(., na.rm = TRUE),
                               Max = ~max(., na.rm = TRUE))))
print("Sleep Data Summaries:")
print(numerical_summary)

#Categorical Summary
categorical_summary <- sleep_dataset %>%
  select(Gender, Occupation, `BMI.Category`, `Blood.Pressure`, `Sleep.Disorder`) %>%
  summarise(across(.cols = everything(),
                   .fns = ~list(table(.))))
print("Categorical Summaries:")
for (name in names(categorical_summary)) {
  cat("\n", name, ":\n")
  print(categorical_summary[[name]])
}

#Correlation Matrix
numerical_data <- sleep_dataset %>%
  select(Age, `Sleep.Duration`, `Quality.of.Sleep`, `Physical.Activity.Level`, `Stress.Level`, `Heart.Rate`, `Daily.Steps`)
correlation_matrix <- cor(numerical_data, use = "complete.obs")
print("Correlation Matrix:")
print(correlation_matrix)
