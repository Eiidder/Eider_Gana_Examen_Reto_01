# Cargar librerías
library(dplyr)
library(naniar) # para visualización
library(ggplot2)

# Cargar datos
df <- read.csv("C:\\Users\\eider\\Downloads\\water-quality-data.csv")

# ---- 1. Análisis de missing values por variable ----
na_por_variable <- colSums(is.na(df))
porcentaje_na_variable <- (na_por_variable / nrow(df)) * 100

# ---- 2. ¿Dónde se concentran más NAs? ----
cat("Variable con más NAs:", names(which.max(na_por_variable)), "\n")
cat("Porcentaje de NAs:", max(porcentaje_na_variable), "%\n")

# ---- 3. Análisis de missing por registro (fila) ----
na_por_fila <- rowSums(is.na(df))
top5_filas <- sort(na_por_fila, decreasing = TRUE)[1:5]
porcentaje_top5 <- (top5_filas / ncol(df)) * 100

# Mostrar resultados
print(top5_filas)
print(porcentaje_top5)

# ---- 4. Visualización de la distribución de los NAs ----
set.seed(123)
muestra <- df[sample(1:nrow(df), size = round(0.01 * nrow(df))), ]

# Visualización
vis_miss(muestra) + ggtitle("Distribución de NA en el 1% de la muestra")

# Tipo de patrón NA → puede parecer MCAR si están dispersos aleatoriamente
cat("Posible patrón de NA: MCAR (faltan de forma aleatoria)\n")

# ---- 5. Imputación usando KNN (opcional con VIM si se instala)
# library(VIM)
# imputado <- kNN(df, variable = c("Area", "Site.Type"))
