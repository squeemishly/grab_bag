$.ajax({
     url : ("/api/v1/meta_data/photos/locations"),
     type : 'GET',
     success : function(data) {
        var locations = data;
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
            }
          } );
    }
});