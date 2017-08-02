$.ajax({
     url : ("/api/v1/facebook/facebook_taggers"),
     type : 'GET',
     success : function(data) {
        var json_data = data;
        var keys = Object.keys(json_data);
        var values = Object.values(json_data);
          var ctx = document.getElementById('taggers').getContext('2d');
          var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
              labels: keys,
              datasets: [{
                data: values,
                label: "# of Tags",
                backgroundColor: "#95a5a6"
              }]
            },
            options: {
              title: {
                display: true,
                position: 'top',
                fontColor: '#95a5a6',
                text: 'Top 5 People who Tag You On Facebook'
              },
              scales: {
                  yAxes: [{
                    display: true,
                    gridLines: {
                      display : false
                    },
                      ticks: {
                          beginAtZero:true
                      }
                  }],
                  xAxes: [{
                    display: true,
                    gridLines: {
                      display : false
                    },
                      ticks: {
                        autoSkip:false,
                        maxRotation:30,
                        minRotation:30,
                        fontSize:11
                      }
                  }]
                }
            }
          });
    }
});
