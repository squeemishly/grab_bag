$.ajax({
     url : ("/api/v1/meta_data/photos/filtered_by_year"),
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


var bigValueSlider = document.getElementById('slider-huge'),
  bigValueSpan = document.getElementById('huge-value');

noUiSlider.create(bigValueSlider, {
  start: 0,
  step: 1,
  format: wNumb({
    decimals: 0
  }),
  range: {
    min: 0,
    max: 10
  }
});

var range = [
  '2007','2008','2009','2010',
  '2011','2012','2013','2014',
  '2015','2016','2017'
];

bigValueSlider.noUiSlider.on('update', function ( values, handle ) {
  bigValueSpan.innerHTML = range[values[handle]];
});
