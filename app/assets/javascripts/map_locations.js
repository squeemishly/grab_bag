var locations = [ {
      "latitude": 40.3951,
      "longitude": -73.5619,
      "type": "circle",
      "color": "#6c00ff",
      "zoomLevel": 5,
    }, {
      "latitude": 40.3961,
      "longitude": -73.5629,
      "type": "circle",
      "color": "#6c00ff",
      "zoomLevel": 5,
    } ]
/**
 * Create the amCharts Map
 */
var ammap = AmCharts.makeChart( "ammap", {
  "type": "map",
  "theme": "light",
  "zoomDuration": 0,
  "dataProvider": {
    "map": "worldLow",
        "images": locations,
    "getAreasFromMap": true
  },
  "areasSettings": {
    "autoZoom": false
  },
  "zoomControl": {
    "zoomFactor": 2,
    "maxZoomLevel": 1048576,
    "panControlEnabled": true,
    "top": 50
  },
  "listeners": [ {
    "event": "positionChanged",
    "method": function( e ) {
      /**
       * GMap inited?
       */
      if ( typeof gmap === "undefined" )
        return;
     
      // set google map zoom level:
      gmap.setZoom(Math.log2(ammap.zoomLevel()) + 1);

      // sync position
      gmap.setCenter( {
          // a small adjustment needed for this div size:
          lat: ammap.zoomLatitude()+ 0.06,
          lng: ammap.zoomLongitude()
      } );
    }
  } ]
} );