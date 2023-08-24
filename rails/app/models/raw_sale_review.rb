# frozen_string_literal: true

class RawSaleReview < ApplicationRecord
  belongs_to :branch
  belongs_to :city

  enum gender: {
    male: 0,
    female: 1,
    other: 99
  }, _prefix: true

  enum property_type: {
    apartment: 0,
    house: 1,
    land: 2
  }, _prefix: true

  enum previous_experience: {
    first: 0, # 初めて
    second: 1, # 2回目
    more: 99 # 3回以上
  }, _prefix: true

  enum agency_type: {
    senzoku_sennin: 0, # 専属専任媒介契約
    sennin: 1, # 専任媒介契約
    ippan: 2, # 一般媒介契約
    other: 99 # 分からない
  }, _prefix: true

  enum sale_reason: {
    moving: 0, # 住み替え
    inheritance: 1, # 相続
    job_change: 2, # 転勤、転職
    divorce: 3, # 離婚
    assets_management: 4, # 資産整理
    financial: 5, # 金銭的な理由
    other: 99 # その他
  }, _prefix: true
end
