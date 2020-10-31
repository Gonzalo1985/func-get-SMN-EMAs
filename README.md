# func-get-SMN-EMAs

Función que hace consulta a la base de datos de estaciones automáticas con la que cuenta el Servicio Meteorológico Nacional (SMN) de Argentina. Las variables a definir son:

* **ruta.lib:** indicación de la ruta en donde se encuentran instaladas las librerías de R

* **nro.redes:** vector de ID de las redes que desea consultarse:

ID = 1 - Bolsa de Cereales de Córdoba

ID = 2 - Bolsa de Cereales de Entre Ríos

ID = 3 - Servicio Meteorológico Nacional (propias)

ID = 4 - AySA

ID = 5 - Alumbrera (no se encuentran en funcionamiento)

ID = 6 - Azul (no se encuentran en funcionamiento)

ID = 7 - SINARAME

ID = 8 - INTA (región provincia de Buenos Aires)

ID = 9 - Ministerio de Producción de Chaco (no se encuentran en funcionamiento)

ID = 10 - Ministerio de Producción de Corrientes

ID = 11 - Proyecto SOBA (Sudoeste de Buenos Aires)

ID = 12 - SAT (Sistema de la Ciudad Autónoma de Buenos Aires)
  
* **fecha.utc.ini:** indicación de la fecha inicial a consultar en el formato, YYYY-MM-DDTHH:MM:SS

* **fecha.utc.fin:** indicación de la fecha final a consultar en el formato, YYYY-MM-DDTHH:MM:SS

## Ejemplo de como ejecutar la función en R:
Se muestra un ejemplo de como utilizar la función desde R. En este caso, se hace consulta de datos de las redes de la Bolsa de Cereales de Córdoba (id 1), Servicio Meteorológico Nacional (id = 3) y SINARAME (id = 7). Entre 2020-10-31T12:00:00 y 2020-11-01T12:00:00
```
ruta.lib <- /ruta/en/donde/se/encuentran/instaladas/las/librerias/R
nro.redes <- c(1, 3, 7)
fecha.utc.ini <- "2020-10-31T12:00:00"
fecha.utc.fin <- "2020-11-01T12:00:00"
func_get_SMN_EMAs(ruta.lib, nro.redes, fecha.utc.ini, fecha.utc.fin)
```


