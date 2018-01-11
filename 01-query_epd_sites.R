install.packages("devtools") 
library(devtools)
install_github("dinilu/EPDr")

library(EPDr)
epd.connection <- connect_to_epd(database = "epd", user = "epdr", password = "epdrpw", host="150.214.194.129", port=10008)

library(rgdal)
study_area <- readOGR("../Data/EPD-Med Sites.kml")
study_area <- SpatialPolygons(study_area@polygons, proj4string=study_area@proj4string)

epd_sites <- list_e(epd.connection, coords=c(-180,180,-90,90))
study_sites <- list_e(epd.connection, shapefile=study_area)
plot(epd_sites[,c("londd","latdd")])
plot(study_area, add=T)
points(study_sites[,c("londd","latdd")], col="red")
dim(study_sites)
dim(epd_sites)

