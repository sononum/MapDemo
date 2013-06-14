# Mapbox, Mapviews, Tilemill and more...

## Ulrich Zurucker @ [Cocoa Heads Munich](http://cocoaheads.org/de/Munich/),  2013-06-13

Some things about mapbox, Tilemill, OSM & more (german)

You can find 

* a simple Xcode project on how to display a MapView
* a Keynote Presentation in ./Vortrag
* a modified version of TileMill OSMBright project (copy into your Tilemill/projects folder)

note, you will have to update submodules after clone (mapbox-ios-sdk). The Mapbox SDK contains submodules too.

The Xcode project conatins an external mbtiles resource which will not be included, but you should be able to render this map with the knowledge gained in the presentation.

There are external references in the TileMill project too, change them.

## Make

There is a `Makefile` in `Vortrag`. This should download, & import OSM data of southern Germany, Switzerland, Italy and Austria into a PostgreDB.
It will also create hillshade and contourlines of the eastern alps region. Bring some patience.

