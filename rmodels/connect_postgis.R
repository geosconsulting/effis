library(RODBC)
library(rgdal)

options(StringsAsFactors=F)
con <- odbcConnect("effis")
sqlQuery(con, "SELECT PostGIS_full_version();")

sql <- paste("SELECT fire.fire_id, fire.country, burnt_area.firedate, burnt_area.broadlea, burnt_area.conifer, ", 
       "burnt_area.mixed, burnt_area.agriareas, burnt_area.artifsurf, burnt_area.critech, emission.chemical,", 
       "emission.total, emission.average, emission.peak, \"burntAreaForecast\".time_horizon,", 
       "\"burntAreaForecast\".date, hotspot_cluster.area, hotspot_cluster.province, ST_AsEWKT(hotspot_cluster.geom)", 
       "FROM fire ", 
        " LEFT JOIN burnt_area ON burnt_area.fire = fire.fire_id", 
        " LEFT JOIN emission ON emission.fire_id = fire.fire_id", 
        " LEFT JOIN \"burntAreaForecast\" ON \"burntAreaForecast\".fire = fire.fire_id", 
        " LEFT JOIN hotspot_cluster ON hotspot_cluster.fire_id = fire.fire_id", 
        " WHERE fire.fire_id = 1;")

analisi_cont <- sqlQuery(con, sql)

htspot_query <- "select hs_date,hs_time,corine,st_x(o.geom) x,st_y(o.geom) y from hotspots o, country_stable s where 
                                      st_intersects(o.geom,s.geom) and country like 'TR'"
hotspots <- sqlQuery(con, htspot_query)
hotspots$x_numeric <- as.numeric(hotspots$x)
hotspots$y_numeric <- as.numeric(hotspots$y)
coordinates(hotspots) <- ~x_numeric + y_numeric
plot(hotspots, pch = 21, bg = 2, cex = 0.4,main='Hotspots for Turkey')
box()
axis(1)
axis(2)
grid()

hotspots_df <- as.data.frame(hotspots)

library(feather)

path <- "~/hotspots.feather"
write_feather(hotspots_df,path)


#db <- odbcConnect("effis", uid="postgres", pwd="antarone")
#sql <- "select GeometryType(geom), NumGeometries(geom),asewkt(geom) as asewkt, gid from hotspots"
#res <- sqlQuery(db, sql)
#geomtype <- as.character(res$geometrytype)
#geomnum <- as.character(res$numgeometries)
#geom <- as.character(res$asewkt)
#geomdesc <- as.character(res$gid)
