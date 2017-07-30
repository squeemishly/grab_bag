$.ajax({
     url : ("/api/v1/file/adjectives"),
     type : 'GET',
     success : function(data) {
        var json_data = data;
        var keys = Object.keys(json_data);
        var values = Object.values(json_data);
          var ctx = document.getElementById('likers').getContext('2d');
          var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
              labels: ['Jerry', 'Kelly', 'Annie', 'Bobbie', 'Joan'],
              datasets: [{
                data: [15, 12, 10, 9, 7],
                label: "# of Likes",
                backgroundColor: "#2ecc71"
                  }]
            },
            options: {
              title: {
                display: true,
                position: 'top',
                fontColor: '#2ecc71',
                text: 'Top 5 People Who Like Your Facebook Photos'
              },
              scales: {
                  yAxes: [{
                      ticks: {
                          beginAtZero:true
                      }
                  }]
              }
            }
          });

    }
});



// <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
// <div id="chart_div"></div>
//
// google.charts.load('current', {packages: ['corechart', 'bar']});
// google.charts.setOnLoadCallback(drawBasic);
//
// function drawBasic() {
//
// 			var people = [['Name', 'Likes'],
//                     ['Eddie', 18],
//                     ['Susie', 12],
//                     ['Peter', 7],
//                     ['Pauline', 6],
//                     ['Jerry', 3]];
//
//       var data = google.visualization.arrayToDataTable(people);
//
//       var options = {
//         title: 'Top 5 People to Like Your Photos on Facebook',
//         hAxis: {
//           title: 'Liker'
//         },
//         vAxis: {
//           title: 'Number of Likes'
//         }
//       };
//
//       var chart = new google.visualization.ColumnChart(
//         document.getElementById('chart_div'));
//
//       chart.draw(data, options);
//     }
