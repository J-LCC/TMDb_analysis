
#  ------- LIMPIADO INICIAL DE LOS DATOS ----------

# ---- DATOS DE PELICULAS -----

# En primer lugar, vamos a abrir el .csv 
movies <- read.csv("D:/Master_BigData/10.TFM/tfm_r/movies.csv", header = TRUE, na = "NA")

# Cargar las librerias necesarias
library(tidyverse)
library(jsonlite)

# Pequeña vista general de los datos
glimpse(movies)
summary(movies)
movies <- as_tibble(movies)

# Eliminamos las columnas que no vamos a trabajar con ellas
movies <- select(movies, -c(homepage, keywords, status, spoken_languages, overview, tagline, runtime,
                            original_title))



# Extraemos la información util de los json
# En primer lugar, queremos extraer el género de las peliculas
genres <- movies %>%
  filter(nchar(genres)>2) %>%
  mutate(js = lapply(genres, fromJSON)) %>%
  unnest(js, .name_repair = "unique") %>%
  select(id, title, genres=name) %>%
  mutate_if(is.character, factor)
# Hay varios generos por pelicula, con quedarnos con 1 es suficiente
join_genres <- genres %>% group_by(id) %>% summarise_all(funs(max(as.character(.))))
# Unimos la nueva columna a la base de datos de trabajo
movies <- left_join(movies, join_genres %>% select(id, genre = genres), by="id")
rm(genres,join_genres)




# En segundo lugar, nos interesa extraer al menos una productora
production <- movies %>% 
  mutate(js = lapply(production_companies, fromJSON)) %>%
  unnest(js, .name_repair = "unique") %>%
  select(id, name) 

# Nos quedamos con la productora principal
join_prod <- production %>% group_by(id) %>% summarise_all(funs(max(as.character(.))))
# Unimos la nueva columna a la base de datos
movies <- left_join(movies, join_prod %>% select(id, production = name), by="id")
rm(production, join_prod)




# Por último extraemos el pais donde se ha producido la pelicula
country <- movies %>% 
  mutate(js = lapply(production_countries, fromJSON)) %>%
  unnest(js, .name_repair = "unique") %>%
  select(id, name) 
# Igualmente, solo nos quedamos con el pais principal
join_countries <- country %>% group_by(id) %>% summarise_all(funs(max(as.character(.))))
# Y los unimos a la base de datos
movies <- left_join(movies, join_countries %>% select(id, country = name), by="id")
rm(country,join_countries)



# Como ya no nos hacen falta los json, los quitamos de la base datos
movies <- select(movies, -c(production_companies, production_countries, genres))



# ---- DATOS DE CASTING -----

# Debido a la mayor complejidad del JSON, usamos un kernel proporcionado por la comunidad
# El kernel estará debidamente documentado en la memoria

# Con el JSON depurado previamente, en primer lugar, vamos a abrir el .csv 
casting <- read.csv("D:/Master_BigData/10.TFM/tfm_r/cast.csv", header = TRUE, na = "NA")

# Nos interesa los dos actores principales de cada pelicula, movemos dichas columnas a movies
movies <- left_join(movies, casting %>% select(id = movie_id, 
                                               principal_actor,
                                               secondary_actor), by="id")



# Por último, exportamos el csv con movies para la siguiente parte del análisis

write.csv(movies, "D:/Master_BigData/10.TFM/tfm_r/movies_EDA.csv")

