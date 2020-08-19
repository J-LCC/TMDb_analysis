# Análisis del mercado cinematográfico 
En este proyecto, se va a analizar la base de datos de películas **TMDb**, dando un mejor entendimiento del mercado cinematográfico. **En primer lugar, mediante los paquetes que ofrece R**, se realizará un análisis gráfico completo, desde un tratamiento inicial de los valores atípicos, hasta mostrar las combinaciones más potentes entre dplyr, para filtrar datos y ggplot para exponerlos gráficamente. 

**En segundo lugar, se van a realizar reportes con Power BI**, centrándonos en crear un panel interactivo, donde el usuario pueda alcanzar un mejor entendimiento de los datos y del sector.

Se estudiarán una serie de variables continuas, el presupuesto, el beneficio, la media de voto de las películas, las votaciones totales y la popularidad de las películas. Pero también una serie de variables categóricas, como el género de las películas, los actores, la productora, o las películas en sí.

### Parte 1: Análisis exploratorio de datos en R. Modelo lineal y sistema de recomendaciones

Los ficheros se componen en el siguiente orden:

- 1.limpiado_inicial.R

- 2.EDA.Rmd

- 3.RECOMEN.Rmd

- 4.modelo_lineal.Rmd

**PRIMERO**: Un limpiado inicial de los datos, extraídos directamente del siguiente [fichero de Kaggle](https://www.kaggle.com/tmdb/tmdb-movie-metadata/).

**SEGUNDO**: Realización de un EDA, explorando las posibilidades que nos ofrece R con respecto a la visualización y filtrado de datos, en el siguiente [enlace de RPubs](https://rpubs.com/JLCC/film-industry/) se aloja el EDA completo de este mismo análisis.

**TERCERO**: Un sistema de recomendaciones basado en el puntaje de las películas. El código está completo en el fichero 3.RECOMEN.Rmd

**CUARTO**: Un modelo lineal ampliado con Ridge y Lasso para predecir el beneficio según el resto de variables continuas del estudio. El código con el modelo completo se puede encontrar en el fihcero 4.modelo_lineal.Rmd



Durante el estudio, observaremos gráficas como las siguientes:
![pop](https://user-images.githubusercontent.com/54073772/88911946-da553f00-d25e-11ea-89f7-4ab7017b5660.jpg)
![rela](https://user-images.githubusercontent.com/54073772/88911948-daedd580-d25e-11ea-8e7a-b882b0ba2d5c.jpg)


### Parte 2: Reportes con Power BI

En los siguientes apartados se van a realizar dos tableros de datos. Nuestra base de datos es muy amplia, así como las posibilidades de realizar tableros de datos concretos. Por lo que vamos a concretar y aportar valor a través de un tablero realizando las siguientes KPIs:

- **Estudio de la productora de cine 20th Century Fox**, siguiendo indicadores de beneficio, presupuesto, y una nueva variable creada en Power BI que mide la rentabilidad de cada película. Este tablero tiene un ámbito de negocio, enfocado a una productora concreta para explorar la situación de la empresa. La vista general del tablero es la siguiente:

![20th Century Fox Analysis](https://user-images.githubusercontent.com/54073772/90623340-9f6b7900-e216-11ea-8c10-609b698beb1c.PNG)

- **Estudio de la rentabilidad y el beneficio de cuatro grandes productoras**, a lo largo de un amplio periodo de tiempo. En general, utilizando toda la base de datos, observar que productoras son más rentables. El ámbito es más general, y no atiende a una necesidad de negocio concreta. La vista general del tablero es la siguiente:

![Reporte_productoras](https://user-images.githubusercontent.com/54073772/90623368-a85c4a80-e216-11ea-8422-d9dbabf91935.PNG)

