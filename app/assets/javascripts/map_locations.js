$(document).ready(function() {  
  var year = 2017;
  getPhotos(year);
})

var getPhotos = function (year) {
  return $.ajax({
      url : ("/api/v1/meta_data/photos/filtered_by_year"),
      type : 'GET',
      data : { year: year },
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
  })
}

var stepSlider = document.getElementById('slider-step');

noUiSlider.create(stepSlider, {
	start: [ 2017 ],
  step: 1,
  format: wNumb({
		decimals: 0
	}),
	range: {
    min: 2007,
    max: 2017
	}
});

var range = [
  '2007','2008','2009','2010',
  '2011','2012','2013','2014',
  '2015','2016','2017'
];

var stepSliderValueElement = document.getElementById('slider-step-value');

stepSlider.noUiSlider.on('update', function( values, handle ) {
  stepSliderValueElement.innerHTML = values[handle];
  getPhotos(values[handle]);
});
