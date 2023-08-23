class SaleReviewRaw < ApplicationRecord
  belongs_to :branch
  belongs_to :city

  enum gender: {
    male: 0,
    female: 10,
    other: -1
  }, _prefix: true

  enum discount: {
    discounted: 0,
    not_discounted: 10,
  }

  enum property_type: {
    apartment: 0,
    house: 10,
    land: 20
  }, _prefix: true

  enum previous_experience: {
    first: 0, # 初めて
    second: 10, # 2回目
    more: -1 # 3回以上
  }, _prefix: true

  enum agency_type: {
    senzoku_sennin: 0, # 専属専任媒介契約
    sennin: 10, # 専任媒介契約
    ippan: 20, # 一般媒介契約
    other: -1 # 分からない
  }, _prefix: true

  enum sale_reason: {
    moving: 0, # 住み替え
    inheritance: 10, # 相続
    job_change: 20, # 転勤、転職
    divorce: 30, # 離婚
    assets_management: 40, # 資産整理
    financial: 50, # 金銭的な理由
    other: -1 # その他
  }, _prefix: true
end
