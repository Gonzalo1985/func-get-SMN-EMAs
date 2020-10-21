# func-get-SMN-EMAs

Función que hace consulta a la base de datos de estaciones automáticas con la que cuenta el Servicio Meteorológico Nacional (SMN) de Argentina. Las variables a definir son:

* **ruta.lib:** indicación de la ruta en donde se encuentran instaladas las librerías de R

* **nro.redes:** vector de ID de las redes que desea consultarse:

ID = 1 - Bolsa de Cereales de Córdoba
ID = 2 - Bolsa de Cereales de Entre Ríos
                       ID = 3 - Servicio Meteorológico Nacional (propias)</p>
                       ID = 4 - AySA</p>
                       ID = 5 - Alumbrera (no se encuentran en funcionamiento)</p>
                       ID = 6 - Azul (no se encuentran en funcionamiento)</p>
                       ID = 7 - SINARAME</p>
                       ID = 8 - INTA (región provincia de Buenos Aires)</p>
                       ID = 9 - Ministerio de Producción de Chaco (no se encuentran en funcionamiento)</p>
                       ID = 10 - Ministerio de Producción de Corrientes</p>
                       ID = 11 - Proyecto SOBA (Sudoeste de Buenos Aires)</p>
                       ID = 12 - SAT (Sistema de la Ciudad Autónoma de Buenos Aires)</p>
                      
* **fecha.utc.ini:** indicación de la fecha inicial a consultar en el formato, YYYY-MM-DDTHH:MM:SS

* **fecha.utc.fin:** indicación de la fecha final a consultar en el formato, YYYY-MM-DDTHH:MM:SS
