library(dplyr)
sleep_dataset<- read.csv("Sleep_health_and_lifestyle_dataset.csv")

summarize_sleep_data <- function(sleep_dataset, var_name, label_name) {
  summary_info <- list()
  summary_info$num_observations <- nrow(sleep_dataset)
  summary_info$max_value <- sleep_dataset %>%
    filter(!!sym(var_name) == max(!!sym(var_name), na.rm = TRUE)) %>%
    select(!!sym(var_name)) %>%
    unlist(use.names = FALSE)
  summary_info$max_value_label <- sleep_dataset %>%
    filter(!!sym(var_name) == max(!!sym(var_name), na.rm = TRUE)) %>%
    select(!!sym(label_name)) %>%
    unlist(use.names = FALSE)
  summary_info$min_value <- sleep_dataset %>%
    filter(!!sym(var_name) == min(!!sym(var_name), na.rm = TRUE)) %>%
    select(!!sym(var_name)) %>%
    unlist(use.names = FALSE)
  summary_info$min_value_label <- sleep_dataset %>%
    filter(!!sym(var_name) == min(!!sym(var_name), na.rm = TRUE)) %>%
    select(!!sym(label_name)) %>%
    unlist(use.names = FALSE)
  summary_info$mean_value <- mean(sleep_dataset[[var_name]], na.rm = TRUE)
  summary_info$std_dev <- sd(sleep_dataset[[var_name]], na.rm = TRUE)
  
  return(summary_info)
}

summary_info <- summarize_sleep_data(sleep_dataset, "Sleep.Duration", "Occupation")
print(summary_info)
