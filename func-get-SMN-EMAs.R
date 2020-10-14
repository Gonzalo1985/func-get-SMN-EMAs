#
# -----------------------------------------------------------------------------#
# Gonzalo M. Diaz
# MINISTERIO DE DEFENSA - Servicio Meteorologico Nacional, Buenos Aires, 15.08.2018
# ----
# -----------------------------------------------------------------------------#
func_get_SMN_EMAs <- function(ruta.lib, nro.redes, fecha.utc.ini, fecha.utc.fin){

# -----------------------------------------------------------------------------#
# Función que hace consulta a la base de datos de estaciones automáticas con la
# que cuenta el Servicio Meteorológico Nacional (SMN) de Argentina
#
#
# A continuación se indican algunos ejemplos de consulta que pueden realizarse:
#
# 1. Datos de propietarios:
#
#     1.1 Todos los propietarios:
#        http://192.168.5.213:8080/aws-api/propietaries
#
#
# 2. Datos de estaciones:
#
#     2.1 Por estacion:
#        http://192.168.5.213:8080/aws-api/stations/{idPropietario}/{idEstacion}
#
#     2.2 Por propietario:
#        http://192.168.5.213:8080/aws-api/stations/{idPropietario}
#
#     2.3 Todas las estaciones:
#        http://192.168.5.213:8080/aws-api/stations/
#
#  Ejemplos:
#        http://192.168.5.213:8080/aws-api/stations/3/7916
#        http://192.168.5.213:8080/aws-api/stations/3
#
#
# 3. Datos de observaciones:
#
#     3.1 Por estacion:
#        http://192.168.5.213:8080/aws-api/observations/{idPropietario}/{idEstacion}/{fechaDesde}/{fechaHasta}
#
#     3.2 Por propietario:
#        http://192.168.5.213:8080/aws-api/observations/{idPropietario}/{fechaDesde}/{fechaHasta}
#
#  Ejemplos:
#        http://192.168.5.213:8080/aws-api/observations/3/2018-08-28T12:00:00/2018-08-28T13:00:00
#
# ---------------------------------------------------------------------------------


# --------------------------------------------------------------------------------#
# ---- Limpieza del Environment y carga de librerias ----
suppressMessages(library("jsonlite", lib.loc = ruta.lib))
suppressMessages(library("rgdal"   , lib.loc = ruta.lib))
suppressMessages(library("raster"  , lib.loc = ruta.lib))
suppressMessages(library("fields"  , lib.loc = ruta.lib))
# ---------------------------------------------------------------------------------


# ------------------- REDES DE ESTACIONES AUTOMATICAS ----
json.file <- "http://192.168.5.213:8080/aws-api/propietaries"
redes     <- jsonlite::fromJSON(json.file)
# -------------------------------------------------------------------------------------------------------------

estaciones <- c() # variable de paso
# ------------------- UBICACION DE ESTACIONES DE REDES AUTOMATICAS ----
for (i in nro.redes)
  {
   json.file  <- paste0("http://192.168.5.213:8080/aws-api/stations/", redes$id[i])
   estaciones[[i]] <- jsonlite::fromJSON(json.file)
  }
# -------------------------------------------------------------------------------------------------------------

registros <- c() # variable de paso
# ------------------- OBSERVACIONES DE ESTACIONES DE REDES AUTOMATICAS ----
for (j in nro.redes)
  {
   json.file <- paste0("http://192.168.5.213:8080/aws-api/observations/", redes$id[j], "/", fecha.utc.ini, "/", fecha.utc.fin)
   registros[[j]] <- jsonlite::fromJSON(json.file)
  }
# -------------------------------------------------------------------------------------------------------------

datos <- c()         # variable de paso
frame.salida <- c()  # variable de paso
for (k in nro.redes)
  {
   # if que chequea si la RED de ESTACIONES se encuentra caida o no, si es asi la saltea
   if (length(registros[[k]]) != 0)
     {
      # union de tablas de estaciones y registros
      datos[[k]] <- merge(registros[[k]], estaciones[[k]][c("idEstacion", "latitud", "longitud")], by = "idEstacion")

      # se ordena el data frame 'datos' por Fecha y Hora
      datos[[k]] <- datos[[k]][order(datos[[k]]$fechaHora), ]

      # se reordena el 'data frame' datos para que las latitudes y longitudes queden adelante
      col.idx.lon <- grep("longitud", names(datos[[k]])) ; col.idx.lat <- grep("latitud", names(datos[[k]]))
      datos[[k]] <- datos[[k]][, c(1, col.idx.lon, col.idx.lat, 2:ncol(datos[[k]]))]
      datos[[k]][, "latitud.1"] <- datos[[k]][, "longitud.1"] <- c()
     }
  }

# retorna el resultado datos de la función
return(datos)
}
