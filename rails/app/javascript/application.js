// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
import "controllers"

// 企業ページにおけるレーダーチャートの描画
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

// 査定依頼ページにおける必須項目の動的切り替え
document.addEventListener('DOMContentLoaded', () => {
  const propertyTypeInput = document.querySelector('#assessment_user_assessment_property_type')

  // 必須項目のアスタリスク
  const exclusiveAreaAst = document.querySelector('.property-exclusive-area span.text-danger')
  const landAreaAst = document.querySelector('.property-land-area span.text-danger')
  const buyildingAreaAst = document.querySelector('.property-building-area span.text-danger')

  // 査定依頼ページでない場合はreturn
  if (!propertyTypeInput || !exclusiveAreaAst || !landAreaAst || !buyildingAreaAst) return

  const setRequiredElement = (astEl, required) => {
    if (required) {
      astEl.style.display = 'inline'
    } else {
      astEl.style.display = 'none'
    }
  }
  const setRequiredElements = (propertyType) => {
    switch (propertyType) {
      case 'apartment':
        setRequiredElement(exclusiveAreaAst, true)
        setRequiredElement(landAreaAst, false)
        setRequiredElement(buyildingAreaAst, false)
        break
      case 'house':
        setRequiredElement(exclusiveAreaAst, false)
        setRequiredElement(landAreaAst, true)
        setRequiredElement(buyildingAreaAst, true)
        break
      case 'land':
        setRequiredElement(exclusiveAreaAst, false)
        setRequiredElement(landAreaAst, true)
        setRequiredElement(buyildingAreaAst, false)
        break
    }
  }

  // 初回ロード時
  setRequiredElements(propertyTypeInput.value)

  // 物件種別変化時
  propertyTypeInput.addEventListener('change', (e) => {
    setRequiredElements(e.target.value)
  })
})
