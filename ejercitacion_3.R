### 1a. Importar tidyverse

# si vuelvo a ejecutar install, lo que hace es actualizar el paquete

install.packages("tidyverse", dependencies=TRUE)

# sí hay que cargar el paquete en cada script

library(tidyverse)

### 1b. Importar la base de datos llamada recorridos_bici.csv, que contiene recorridos realizados con bicicletas del GCBA en 2017.

df <- read_csv('./data/recorridos_bici.csv')
dim(df)
names(df)
colnames(df)
nrow(df)

### 2. Crear un objeto que contenga únicamente 4 variables a elección de la base de datos. 

new_df <- df %>% 
  select(id_estacion_origen, id_estacion_destino, duracion_recorrido, genero_usuario)

view(new_df)
class(new_df)

### 3. Crear un objeto que contenga unicamente los recorridos de mujeres y tres estaciones de origen. 

unique(df$genero_usuario)
unique(df$id_estacion_origen)
filtered_df <- df %>% filter(genero_usuario == 'F', id_estacion_origen %in% c(60, 79, 11))
filtered_df

### 4. Crear una nueva columna llamada "rango_horario" que tenga el valor "Mañana" para los recorridos que empezaron en la mañana 
# y "Tarde" para los recorridos que empezaron en la tarde (después de las 12h). 

df <- df %>% mutate(rango_horario = case_when(
  is.na(hora_salida) ~ "sin dato",
  hora_salida < 12 ~ "Mañana",
  TRUE ~ "Tarde"
))

### 5. Eliminar del dataframe las filas con infromación de latitud y longitud. 

na_df <- df %>% filter(is.na(long_estacion_origen) | is.na(long_estacion_destino) | is.na(lat_estacion_origen) | is.na(lat_estacion_destino))


### 6. Convertir los NA de las columnas "domicilio_estacion_origen" y "domicilio_estacion_destino" 
## en un "Sin información" 

df <- df %>% mutate(
  domicilio_estacion_origen = if_else(is.na(domicilio_estacion_origen), "Sin información", domicilio_estacion_origen),
  domicilio_estacion_destino = if_else(is.na(domicilio_estacion_destino), "Sin información", domicilio_estacion_destino)
)

### 7. Pasar los valores de genero_usuario 
## a minúscula con ayuda de 
## la función str_to_lower(). 

df <- df %>% mutate(
  genero_usuario = str_to_lower(genero_usuario)
)

### 8. Guardar como .csv la última base generada. 

write_csv(df, 'clase3')

### 9. Instalar un paquete que vamos a usar la próxima clase: lubridate. 

install.packages("lubridate")

