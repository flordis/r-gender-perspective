### Ejercicios clase 2

# 1. Creando valores, vectores y dataframes.

# a. Cree un objeto llamado "primer_objeto" que tenga el resultado de la multiplicación 10 x 7.

primer_objeto <- 10*7

# b. Cree un vector llamado "primer_vector" que tenga los valores 15, 30, 45. 

primer_vector <- c(15, 30, 45)

# c. Agregue un cuarto elemento a "primer_vector" que tenga el valor 60. 

primer_vector <- c(primer_vector, 60)

# d. Cree otros dos vectores, pero con variables de texto, que tengan el mismo largo que nuestro primer vector. 

nombres <- c('Flor', 'Berta', 'Marta', 'Julia')
apellidos <- c('Di Stefano', 'Marques', 'Monguillot', 'Pardo')

# e. Cree un dataframe a partir de esos dos vectores. 

trabajadoras <- data.frame(nombres, apellidos)

# f. ¿Qué medidas resumen puede utilizar para ver ese dataframe? ¿Y para ver la estructura? 

summary(trabajadoras)

# g. ¿Qué dimensiones tiene ese dataframe?

dim(trabajadoras)

# 2. Explorando un dataset de R: Iris. 
# Al instalar **R** cuentan con un set de bases de datos de "juguete" para hacer ciertas pruebas, experimentos, etc. 
# Iris es uno de ellos.

# a. Cree un objeto llamado 'data' que contenga el resultado de ejecutar datasets::iris o, si tira error, sólo iris

data <- datasets::iris

# b. Teniendo en cuenta que iris es una función, ¿qué comando puedo utilizar para que R me devuelva información del dataset? 

str(data)
names(data)

?iris

# c. Imprima las primeras 20 filas de iris. 

head(data, 20)

# d. ¿Cuáles son los valores únicos de la columna "Species"? 

unique(data$Species)

# e. Cree un nuevo dataframe llamado 'setosa' que contenga otdas las filas cuya especie es Setosa. 

setosa <- data[data$Species == 'setosa', ]
