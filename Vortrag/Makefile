
bayern-latest.osm.pbf:
	curl http://download.geofabrik.de/europe/germany/bayern-latest.osm.pbf > bayern-latest.osm.pbf

baden-wuerttemberg-latest.osm.pbf:
	curl http://download.geofabrik.de/europe/germany/baden-wuerttemberg-latest.osm.pbf > baden-wuerttemberg-latest.osm.pbf

austria-latest.osm.pbf:
	curl http://download.geofabrik.de/europe/austria-latest.osm.pbf > austria-latest.osm.pbf

switzerland-latest.osm.pbf:
	curl http://download.geofabrik.de/europe/switzerland-latest.osm.pbf > switzerland-latest.osm.pbf

italy-latest.osm.pbf:
	curl http://download.geofabrik.de/europe/italy-latest.osm.pbf > italy-latest.osm.pbf

osm_db: bayern-latest.osm.pbf baden-wuerttemberg-latest.osm.pbf austria-latest.osm.pbf italy-latest.osm.pbf
	osm2pgsql -c -G -d osm -S /usr/local/share/osm2pgsql/default.style bayern-latest.osm.pbf
	osm2pgsql -a -G -d osm -S /usr/local/share/osm2pgsql/default.style baden-wuerttemberg-latest.osm.pbf
	osm2pgsql -a -G -d osm -S /usr/local/share/osm2pgsql/default.style austria-latest.osm.pbf
	osm2pgsql -a -G -d osm -S /usr/local/share/osm2pgsql/default.style switzerland-latest.osm.pbf
	osm2pgsql -a -G -d osm -S /usr/local/share/osm2pgsql/default.style italy-latest.osm.pbf -C 4000


srtm_38_03.tif:
	curl ftp://xftp.jrc.it/pub/srtmV4/tiff/srtm_38_03.zip > srtm_38_03.zip
	unzip srtm_38_03.zip srtm_38_03.tif
	rm srtm_38_03.zip

srtm_38_04.tif:
	curl ftp://xftp.jrc.it/pub/srtmV4/tiff/srtm_38_04.zip > srtm_38_04.zip
	unzip srtm_38_04.zip srtm_38_04.tif
	rm srtm_38_04.zip

srtm_39_03.tif:
	curl ftp://xftp.jrc.it/pub/srtmV4/tiff/srtm_39_03.zip > srtm_39_03.zip
	unzip srtm_39_03.zip srtm_39_03.tif
	rm srtm_39_03.zip

srtm_39_04.tif:
	curl ftp://xftp.jrc.it/pub/srtmV4/tiff/srtm_39_04.zip > srtm_39_04.zip
	unzip srtm_39_04.zip srtm_39_04.tif
	rm srtm_39_04.zip

srtm_3839_0304.tif: srtm_38_03.tif srtm_38_04.tif srtm_39_03.tif srtm_39_04.tif
	gdal_merge.py srtm_38_03.tif srtm_38_04.tif srtm_39_03.tif srtm_39_04.tif -o srtm_3839_0304.tif

srtm_3839_0304-3785.tif: srtm_3839_0304.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_3839_0304.tif srtm_3839_0304-3785.tif

hillshade.tif: srtm_3839_0304-3785.tif
	gdaldem hillshade srtm_3839_0304-3785.tif hillshade.tif
	
slope.tif: srtm_3839_0304-3785.tif
	gdaldem slope srtm_3839_0304-3785.tif slope.tif

slopeshade.tif: slope.tif slope-ramp.txt
	gdaldem color-relief slope.tif slope-ramp.txt slopeshade.tif

contour.shp: srtm_3839_0304-3785.tif
	gdal_contour -a height srtm_3839_0304-3785.tif contour.shp -i 100

