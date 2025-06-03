library(dplyr)

datos <- read.csv("water-quality-data.csv")

variables <- datos %>% select(Value, MDL, RDL)

resumen <- variables %>%
  summarise(
    Max_Value = max(Value, na.rm = TRUE),
    Min_Value = min(Value, na.rm = TRUE),
    Mean_Value = mean(Value, na.rm = TRUE),
    Median_Value = median(Value, na.rm = TRUE),
    SD_Value = sd(Value, na.rm = TRUE),
    
    Max_MDL = max(MDL, na.rm = TRUE),
    Min_MDL = min(MDL, na.rm = TRUE),
    Mean_MDL = mean(MDL, na.rm = TRUE),
    Median_MDL = median(MDL, na.rm = TRUE),
    SD_MDL = sd(MDL, na.rm = TRUE),
    
    Max_RDL = max(RDL, na.rm = TRUE),
    Min_RDL = min(RDL, na.rm = TRUE),
    Mean_RDL = mean(RDL, na.rm = TRUE),
    Median_RDL = median(RDL, na.rm = TRUE),
    SD_RDL = sd(RDL, na.rm = TRUE)
  )

print(resumen)
