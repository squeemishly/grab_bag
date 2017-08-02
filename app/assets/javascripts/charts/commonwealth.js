$.ajax({
    url: ("/api/v1/file/american"),
    type: 'GET',
    success: function(data) {
        var values = Object.values(data);
        var keys = Object.keys(data);
        var ctx = document.getElementById('commonwealth').getContext('2d');
        var myChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: keys,
            datasets: [{
              backgroundColor: [
                "#2ecc71",
                "#3498db",
                "#95a5a6",
                "#9b59b6",
                "#f1c40f",
                "#e74c3c",
                "#34495e"
              ],
              data: values
            }]
          },
          options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            title: {
              display: true,
              text: 'British English'
              }
            }
        });
    }
});
