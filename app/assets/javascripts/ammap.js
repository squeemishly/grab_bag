var icon = "M21.25,8.375V28h6.5V8.375H21.25zM12.25,28h6.5V4.125h-6.5V28zM3.25,28h6.5V12.625h-6.5V28z";
/**
 * Create the amCharts Map
 */
var ammap = AmCharts.makeChart( "ammap", {
  "type": "map",
  "theme": "light",
  "zoomDuration": 0,
  "dataProvider": {
    "map": "worldLow",
        "images": [ {
      "latitude": 40.3951,
      "longitude": -73.5619,
      "svgPath": icon,
      "color": "#CC0000",
      "scale": 0.5,
      "label": "New York",
      "labelShiftY": 2
    } ],
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