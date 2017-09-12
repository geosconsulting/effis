library(leaflet)

map <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(lat=41.78, lng= 12.36, popup="Casa")

map
