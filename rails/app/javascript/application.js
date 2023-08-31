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
  const exclusiveArea = document.querySelector('.property-exclusive-area')
  const landArea = document.querySelector('.property-land-area')
  const buyildingArea = document.querySelector('.property-building-area')

  // 査定依頼ページでない場合はreturn
  if (!propertyTypeInput || !exclusiveArea || !landArea || !buyildingArea) return

  const setRequiredElement = (el, required) => {
    if (required) {
      el.style.display = 'flex'
    } else {
      el.style.display = 'none'
    }
  }
  const setRequiredElements = (propertyType) => {
    switch (propertyType) {
      case 'apartment':
        setRequiredElement(exclusiveArea, true)
        setRequiredElement(landArea, false)
        setRequiredElement(buyildingArea, false)
        break
      case 'house':
        setRequiredElement(exclusiveArea, false)
        setRequiredElement(landArea, true)
        setRequiredElement(buyildingArea, true)
        break
      case 'land':
        setRequiredElement(exclusiveArea, false)
        setRequiredElement(landArea, true)
        setRequiredElement(buyildingArea, false)
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
