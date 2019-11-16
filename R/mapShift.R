# Taken fro m https://seethedatablog.wordpress.com/2016/12/31/r-shift-centralprime-meridian-of-world-map/

# ===================================================================================
# Shift central/prime meridian (data.table + ggplot)
# Inspired from the answer of Joris Meys given here:
# http://stackoverflow.com/questions/5353184/fixing-maps-library-data-for-pacific-centred-0-360-longitude-display
# and the code of Claudia Engel at: https://gist.github.com/cengel/2165374#file-greatcircleflights-r
# or at: http://web.stanford.edu/~cengel/cgi-bin/anthrospace/great-circles-on-a-recentered-worldmap-in-ggplot
#
# NOTE: Fails to properly display Antarctica 
# (extra points need to be added in order to properly close the polygons at -90 dg)
# Check a different solution here: https://gist.github.com/valentinitnelav/b4d76cd9e84414ac4d1ac48d64615784
# ===================================================================================

# __________ Load needed libraries __________ #
library(data.table)
library(ggplot2)
library(maps)
library(maptools)

# __________ Get world map in proper format __________ #
# Load world map as map object
worldmap <- map("world", fill=TRUE, plot=FALSE)
# Convert map object to SpatialPolygons object (check ?map2SpatialPolygons)
WGS84 <- CRS("+proj=longlat +datum=WGS84")
worldmapPolys <- map2SpatialPolygons(worldmap, 
                                     IDs=sapply(strsplit(worldmap$names, ":"), "[", 1L), 
                                     proj4string=WGS84)

# __________ Prepare data for ggplot and shift coordinates __________ #
# shift central/prime meridian towards west – positive values only
shift <- 180 + 20

# transform map in a data table that ggplot can use
world_map <- data.table(map_data(as(worldmapPolys, "SpatialPolygonsDataFrame")))

# Shift coordinates (data.table way)
# inspired from the answer of @Joris Meys at:
# http://stackoverflow.com/questions/5353184/fixing-maps-library-data-for-pacific-centred-0-360-longitude-display
# and code of Claudia Engel at: https://gist.github.com/cengel/2165374#file-greatcircleflights-r
# or at: http://web.stanford.edu/~cengel/cgi-bin/anthrospace/great-circles-on-a-recentered-worldmap-in-ggplot
world_map[, long.new := long + shift]
world_map[, long.new := ifelse(long.new > 180, long.new-360, long.new)]

# split up coordinates of polygons that differ too much (got split across the globe)
world_map[, to.split := sum(diff(long.new) > 300, na.rm=TRUE) > 0, by=group]
world_map[, gr.split := ifelse(to.split & long.new < 0, paste0(group, ".", 1), group)]

# plot shifted map
ggplot() + 
  geom_polygon(data=world_map,
               aes(x=long.new, y=lat, group=gr.split), 
               colour="black", fill="gray80", size = 0.25) +
  coord_equal()
