const ctx = document.getElementById("branchRaderGraph");
const  branchRaderGraph = new Chart(ctx, {
  type: 'radar',
  data: {
    labels: ['対応満足', '売却スピード', '売却価格'],  // ラベル名: ワイヤーフレームに記載されている
    datasets: [{
      backgroundColor: "rgba(106, 251, 251, 0.5)",
      borderColor: "rgba(106, 251, 251, 0.9)",
      pointBackgroundColor: "rgba(106, 251, 251, 1)",
      pointBorderColor: "#fff",
      data: [3.5, 4.5, 5]
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        display: false,
      }
    },
    hover: {
      mode: 'index',
      intersec: false
    },
    pointHitRadius: 75,
    scales: {
      r: {
          angleLines: {
              display: false
          },
          suggestedMin: 0,
          suggestedMax: 5,
          ticks: {
            stepSize: 1
          }
        }
      }
  }
});
