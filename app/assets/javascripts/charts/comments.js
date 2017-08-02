$.ajax({
     url : ("/api/v1/facebook/facebook_commenters"),
     type : 'GET',
     success : function(data) {
        var json_data = data;
        var keys = Object.keys(json_data);
        var values = Object.values(json_data);
          var ctx = document.getElementById('comments').getContext('2d');
          var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
              labels: keys,
              datasets: [{
                data: values,
                label: "# of Comments",
                backgroundColor: "#3498db"
              }]
            },
            options: {
              title: {
                display: true,
                position: 'top',
                fontColor: '#3498db',
                text: 'Top 5 Facebook Commenters'
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
