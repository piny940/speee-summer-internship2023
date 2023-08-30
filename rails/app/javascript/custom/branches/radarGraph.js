document.addEventListener('DOMContentLoaded', () => {
  const ctx = document.querySelector("#branchRadarGraph");
  if (!ctx) return

  const scoresObj = JSON.parse(ctx.getAttribute('data-scores'))
  let scores = [
    // 並び順は表示ラベル名の並びに対応
    scoresObj.service,
    scoresObj.speed,
    scoresObj.price
  ].map((str) => Number(str))

  const  branchRadarGraph = new Chart(ctx, {
    type: 'radar',
    data: {
      labels: ['対応満足', '売却スピード', '売却価格'],  // ラベル名: ワイヤーフレームに記載されている
      datasets: [{
        backgroundColor: "rgba(106, 251, 251, 0.5)",
        borderColor: "rgba(106, 251, 251, 0.9)",
        pointBackgroundColor: "rgba(106, 251, 251, 1)",
        pointBorderColor: "#fff",
        data: scores
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
})
